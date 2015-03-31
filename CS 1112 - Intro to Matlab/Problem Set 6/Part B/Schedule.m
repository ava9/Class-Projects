classdef Schedule < handle
% A schedule has an Interval window in which events can be scheduled and
% a cell array of Events.
    
    properties (SetAccess = private)
        sname= '';                % The name of the schedule
        window= Interval.empty(); % The Interval in which events can be scheduled
        eventArray= {};           % The cell array of events
    end
    
    methods
        function s=Schedule(startTime, endTime, scheduleName)
        % Construct schedule s.  s.window goes from startTime to endTime.
        % s.sname is the string name that is shown on the schedule.
        % s.eventArray starts as an empty cell array.
            %%%% Write your code below %%%%
            if nargin==3
                s.sname=scheduleName;
                s.window=Interval(startTime,endTime);
                s.eventArray={};
            end

        end
        
        function addEvent(self, ev)
        % Adds Event ev to the end of self.eventArray
            %%%% Write your code below %%%%
            self.eventArray=[self.eventArray {ev}];

        end
        
        function scheduleEvents(self)
        % Schedule events from self.eventArray in self.window.  First
        % unschedules all events.  Then use a heuristic to schedule events
        % as follows:
        % 1. Define a "remaining window," which is the window available for
        %    scheduling events.  Initialize the remaining window to be the 
        %    same as window (same left and right ends).
        % 2. Find the earliest unscheduled event that can be scheduled in
        %    the remaining window.
        % 3. If multiple events have the same earliest time, choose the
        %    event with the highest ratio of importance to duration.
        % 4. If the event is scheduled, update the remaining window.
        % 5. Repeat steps 2 to 4 until no events can be scheduled.
            
            %%%% Write your code below %%%%
            
            %Unschedules all of the events
            for e=1:length(self.eventArray)
                self.eventArray{e}.unschedule();
            end
            
            %Initializes the Remaining Window (remWindow) and "done"
            remWindow=Interval(self.window.left,self.window.right);
            done=0;
            
            while ~done
                
                %Finds event that is next to be scheduled, according to
                %above conditions
                etime=remWindow.right;
                for e=1:length(self.eventArray)
                    if self.eventArray{e}.scheduledTime==-1
                        if etime > self.eventArray{e}.earliestTime(remWindow)
                            etime=self.eventArray{e}.earliestTime(remWindow);
                            e2bsched=e;
                        elseif etime == ...
                                self.eventArray{e}.earliestTime(remWindow)
                            
                            if self.eventArray{e}.importance / ...
                                    self.eventArray{e}.duration > ...
                                    self.eventArray{e2bsched}.importance / ...
                                    self.eventArray{e2bsched}.duration
                                
                                e2bsched=e;
                            end
                        end
                    end
                end
                
                %Schedules event if new event to be scheduled is found and
                %also changes the remaining window, or changes the variable
                %"done" to get out of loop
                if etime==remWindow.right
                    done=1;
                else
                    self.eventArray{e2bsched}.setScheduledTime(etime);
                    remWindow.left=etime+self.eventArray{e2bsched}.duration;
                end
            end
        end
        
        function draw(self)
        % Draws the scedule and all the events.  This method sets up the 
        % figure window, shows the title (self.sname), labels the axes, and 
        % draws each event.  Figure window should be made full screen, 
        % ticks on the y-axis should only be drawn at integer (id) values 
        % and the axes should enclose only the scheduling window in the 
        % x-direction and only the range of event ids in the y-direction.

            %%%% Write your code below %%%%
            
            close all
            figure('units','normalized','outerposition',[0 0 1 1],...
                'name', 'Schedule')
            hold on
            title(self.sname)
            
            xlabel('Time')
            ylabel('Event ID')
            
            for e=1:length(self.eventArray)
                %if self.eventArray{e}.scheduledTime~=-1
                    self.eventArray{e}.draw
                %end
            end
            
            minId=self.eventArray{1}.getId;
            maxId=minId;
            for e=1:length(self.eventArray)
                if self.eventArray{e}.getId<minId
                    minId=self.eventArray{e}.getId;
                end
                if self.eventArray{e}.getId > maxId
                    maxId=self.eventArray{e}.getId;
                end
            end

            set(gca, 'ytick', minId:maxId)
            axis([self.window.left self.window.right minId-1 maxId+1])
            
            hold off

        end
    end %methods
    
end


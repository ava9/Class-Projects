classdef Schedule < handle
% A schedule has an Interval window in which events can be scheduled and
% a cell array of Events.
    
    properties (SetAccess = private)
        sname= '';                % The name of the schedule
        window= Interval.empty(); % The Interval in which events can be scheduled
        eventArray= {};           % The cell array of events
    end
    
    methods
        function s = Schedule(startTime, endTime, scheduleName)
        % Construct schedule s.  s.window goes from startTime to endTime.
        % s.sname is the string name that is shown on the schedule.
        % s.eventArray starts as an empty cell array.
            %%%% Write your code below %%%%

        end
        
        function addEvent(self, ev)
        % Adds Event ev to the end of self.eventArray
            %%%% Write your code below %%%%

        end
        
        function scheduleEvents(self)
        % Schedule events from self.eventArray in self.window.  First
        % unschedules all events.  Then use a heuristic to schedule events
        % as follows:
        % 1. Define a "remaining window," which is the window available for
        %    scheduling events.  Initialize the remaining window to be the 
        %    same as window (same left and reight ends).
        % 2. Find the earliest unscheduled event that can be scheduled in
        %    the remaining window.
        % 3. If multiple events have the same earliest time, choose the
        %    event with the highest ratio of importance to duration.
        % 4. If the event is scheduled, update the remaining window.
        % 5. Repeat steps 2 to 4 until no events can be scheduled.
            
            %%%% Write your code below %%%%

        end
        
        function draw(self)
        % Draws the scedule and all the events.  This method sets up the 
        % figure window, shows the title (self.sname), labels the axes, and 
        % draws each event.  Figure window should be made full screen, 
        % ticks on the y-axis should only be drawn at integer (id) values 
        % and the axes should enclose only the scheduling window in the 
        % x-direction and only the range of event ids in the y-direction.

            %%%% Write your code below %%%%

        end
    end %methods
    
end


classdef Event < handle
% An event has an id, an Interval in which it can be scheduled, a duration,
% a real value between 0 and 1 representing its importance, and a time at
% which it's scheduled.
    
    properties(Access = private)
        id              % Unique id 
    end %private properties
    
    properties
        available= Interval.empty();  % Available Interval
        duration        % Length of the event
        importance      % Importance, a real value between 0 and 1
        scheduledTime   % Scheduled start time; -1 if unscheduled
    end %public properties
    
    methods
        function e = Event(availableStart, availableFinish, duration, importance, id)
        % Construct event e.  e.scheduledTime is initialzed to -1.
        % availableStart and availableFinish represent the left and right 
        %   bounds of the available interval. 
        % All other fields are directly represented by the input parameters.
            
            % Only set fields to arguments if all 5 arguments are given
            if (nargin == 5)
                e.duration = duration;
                % Construct the available interval from open and close time
                e.available = Interval(availableStart, availableFinish);
                e.importance = importance;
                e.id = id;
            else 
                e.duration = 0;
                e.available = Interval();
                e.importance = 0;
                e.id = -1;
            end
            % Scheduled time always initialized to -1
            e.scheduledTime = -1;
        end
        
        function t = earliestTime(self, possibleInterval)
        % t is the earliest time that self can be scheduled in the given
        % possibleInterval.  (possibleInterval is an Interval handle.) 
        % If self cannot be scheduled in that Interval, then t is inf.
            
            % Determine if the event can be scheduled by checking if the
            % intersection of the available and possible intervals is
            % greater than the event's duration.

            %%%% Write your code below %%%%
        
        end
        
        function setScheduledTime(self, t)
        % Sets the time that self is scheduled for to t   
            %%%% Write your code below %%%%

        end
        
        function unschedule(self)
        % Unschedules self (set scheduledTime to -1)
            %%%% Write your code below %%%%

        end
        
        function id = getId(self)
        % Gets the private access id
            %%%% Write your code below %%%%

        end
        
        function draw(self)
        % Draws the event.  Up to two rectangles are drawn for a given
        % event.  First, a white rectangle is drawn (with black border)
        % representing the available interval, using available.left and
        % available.right as the minimun and maximum x coordinates of the 
        % rectangle.  Then, if the event is scheduled, the time during which 
        % the event is scheduled is drawn as a colored rectangle, with the 
        % color being the linear interpolation from magenta to cyan based on 
        % the importance field:  cyan correponds to very important (1) while
        % magenta corresponds to unimportant (0).  Both rectangles are centered
        % on y = self.getId() and should have a height less than 1.  Assume
        % that a figure window already is open and hold is on.

            bestColor= [0 1 1];    %cyan
            worstColor= [1 0 1];   %magenta

            %%%% Write your code below %%%%

        end
        
    end % public methods
    
end % class Event
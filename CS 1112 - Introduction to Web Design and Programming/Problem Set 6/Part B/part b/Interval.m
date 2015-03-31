classdef Interval < handle
% An Interval has a left endpoint and a right endpoint.
    
    properties
       left
       right
    end
    
    methods
        function Inter = Interval(lt, rt)
        % Constructor:  construct an Interval object
            if nargin==2
                Inter.left= lt;
                Inter.right= rt;
            end
        end
        
        function w = getWidth(self)
        % Return the width of the Interal
            w= self.right - self.left;
        end
        
        function scale(self, f)
        % Scale self by a factor f
            w= self.getWidth();
            self.right= self.left + w*f;
        end
        
        function shift(self, s)
        % Shift self by s
            self.left= self.left + s;
            self.right= self.right + s;
        end
        
        function tf = isIn(self, other)
        % tf is true (1) if self is in the other Interval
            tf= self.left>=other.left && self.right<=other.right;
        end
        
        function Inter = add(self, other)
        % Inter is the new Interval formed by adding self and the 
        % the other Interval
            newLeft= self.left + other.left;
            newRight= self.right + other.right;
            Inter= Interval(newLeft, newRight);
        end
        
        function Inter = overlap(self, other)
        % If self and the other Interval overlap, then Inter is the
        % overlapped Interval; otherwise Inter is empty.
            Inter= Interval.empty();
            left= max(self.left, other.left);
            right= min(self.right, other.right);
            if right-left > 0
                Inter= Interval(left, right);
            end
        end
        
        function disp(self)
        % Display self, if not empty, in this format: (left,right)
        % If empty, display 'Empty <classname>'
            if isempty(self)
                fprintf('Empty %s\n', class(self))
            elseif length(self)>1
                disp@handle(self)  % syntax to be discussed next lecture
            else
                fprintf('(%f,%f)\n', self.left, self.right)
            end
        end
        
    end %methods
    
end %classdef
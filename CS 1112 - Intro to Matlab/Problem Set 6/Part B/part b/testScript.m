% testScript for Project 6 classes

close all

% Test class Interval
i1= Interval(3,9); % Instantiate an Interval with endpoints 3 and 9
L= i1.left % Should be 3.  The properties have the attribute "public"
%  so it is possible to access the property left directly.
R=il.right
a2= i1.overlap( Interval(5,15) )
% o references an Interval with endpoints 5 and 9.
a3= i1.overlap( Interval (65, 200) )
w= a2.getWidth() % Should be 4, the width of the Interval referenced by a2
disp(i1.scale(2)) %Display Interval with endpoints 3 and 15
disp(i1.shift(5)) %Display Interval with endpoints 8 and 14
disp(i1.isIn( Interval(1,20) )) %should be true (1)
disp(i1.isIn( Interval(1,5) )) %should be false (0)
i1.add( Interval(3,3) )
L = i1.left %should be 6
R = i1.right %should be 12


%Test class Event
e1= Event(3, 20, 10, .5, 4);
% An Event with id 4, importance .5, and duration 10.
% It’s available for scheduling in the interval [3,20].
disp(e1.available.left) %should be 3
disp(e1.available.right) % should be 20
disp(e1.available.getWidth()) % should be 17
disp(e1.duration) %should be 10
disp(e1.importance) %should be 0.5
%add code to create call instance methods as a test
disp(e1.earliestTime( Interval(5,15) ))
disp(e1.getId())
disp(e1.id) % Error: id is private
e1.setScheduledTime(5)
disp(e1.scheduledTime) %should be 5
figure;
hold on
e1.draw() % Should see colored box with left edge at x=5
hold off
e1.unschedule()
figure;
hold on
e1.draw()
hold off


%Test class Schedule
e2 = Event(0, 30, 8, .3, 1)
e3 = Event(8, 25, 6, 0, 5)
s = Schedule(0, 40, 'Test Schedule')
% Instantiate a Schedule object. s.eventArray is empty.
s.sname= 'New name'
% ERROR: property sname has private set access
disp(s.sname) % Should see ’Test Schedule’ since get access is public
s.addEvent(e2) % Add Event e2 to s.eventArray
s.addEvent(e3)
s.addEvent( Event( 10, 38, 5, 1, 2) )
disp(s) % s.eventArray should be a length 3 cell array of Events

disp(s.window.left) %ERROR: property window has private set access
disp(s.window.right) %ERROR: property window has private set access
disp(s.window.getWidth()) %ERROR: property window has private set access
disp(s.eventArray) %ERROR: property eventArray has private set access

s.eventArray{1}.getId() % Should see 1
s.eventArray{1}.setScheduledTime(21)
s.scheduleEvents()
figure;
hold on
s.eventArray{1}.draw() % Should see colored box with left edge at x=21
hold off


%Test class Course
c1= Course(8, 25, 6, 0.5, 6, 'CS1000')
figure;
hold on
c1.draw() % Should see white box with x range of 8 to 25
c1.setScheduledTime(9)
hold off
figure;
hold on
c1.draw() % Should see colored box with left edge at x=9 and
% the course name in the middle
hold off
s.addEvent(c1)
disp(s.eventArray) % Should see that the last cell references a Course,
% not an Event
disp(c1.getCourseName()) %should be CS1000
disp(c1.courseName) %ERROR: property courseName has private set access




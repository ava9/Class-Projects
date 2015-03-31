function s = createSchedule( dataFilename, scheduleStart, scheduleFinish )
%   Creates a schedule based on the events data in a text file.
%   dataFilename is a string that names the text data file.
%   All events in dataFilename are added to a schedule within a window from
%   scheduleStart to scheduleFinish.  The events are then scheduled using
%   a heuristic (given in class Schedule), and the schedule is drawn.
%   dataFilename is the name of a file encoding data for all events to add
%   to the newly created schedule. Events are encoded in a given line L as
%   follows: id = L(3:6), startAvailable = L(8:11), endAvailable= L(13:16),
%   duration = L(18:21), and importance = L(23:28). L(1) is 'e' if the line
%   represents a base Event, while L(1) is 'c' if it is a Course.  If the
%   event is a course, L(30:end) encodes the name of the course.

% Open the appropriate file
eventDataFile = fopen(dataFilename);

% Create an empty file
s = Schedule(scheduleStart, scheduleFinish, 'My Schedule');

% Read data from file and add the Event (or Course) to s.eventArray
%%%% Write your code below %%%%

while ~feof(eventDataFile)
    L=fgetl(eventDataFile);
    id=str2double(L(3:6));
    startAvailable = str2double(L(8:11));
    endAvailable= str2double(L(13:16));
    duration = str2double(L(18:21));
    importance = str2double(L(23:28));
    if L(1)=='e'
        e=Event(startAvailable, endAvailable, duration, importance, id);
        s.addEvent(e);
    elseif L(1)=='c'
        cName=L(30:end);
        c=Course(startAvailable,endAvailable,duration,importance,id,cName);
        s.addEvent(c);
    end
end

% Close the data file
fclose(eventDataFile);

% Schedule the events
%%%% Write your code below %%%%
s.scheduleEvents;

% Draw the schedule
%%%% Write your code below %%%%

s.draw;

end


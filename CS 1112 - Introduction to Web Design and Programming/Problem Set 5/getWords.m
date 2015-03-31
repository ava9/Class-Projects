function C = getWords(fname)
% fname is a string that names a plain text file.
% Read from the file and store in a 1-d cell array C all the words that are
% longer than 4 letters and that do not contain any punctuation marks.
% Exclude the "header lines" in the file--use only the words on the
% numbered lines.
fid = fopen(fname, 'r'); %opens and reads popularWords.txt file
k=0;
while ~feof(fid)    
    punctuation = 0;        %create and reset parameter
    proceed = 0;            %create and reset parameter
    s = fgetl(fid);
    for i = 1:length(s)
        %checks current line for (') and (-) characters
        if double(s(i)) == 39 || double(s(i)) == 45
            punctuation = 1;
        end
    end
    if double(s(1)) >= 48 && s(1) <= 57
        %The first character in the line is a number from 0 to 9
        proceed = 1;
    end
    word = [];
    if length(s) > (8+4) && punctuation == 0 && proceed == 1
        %more than 4 char, no punctuation marks, able to proceed
        k=k+1;
        word = [s(9:length(s))];
        C{k} = word; %create 1-d cell array with words meeting the prereqs
    end    
end

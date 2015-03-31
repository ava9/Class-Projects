function [word, updatedUsedWords] = newWord(C, usedWords)
% word is randomly chosen from cell array C but is not in cell array 
%usedWords.
% C is a 1-d cell array of strings; C is not empty.
% usedWords is a (possibly empty) 1-d cell array of strings.
% word is a string randomly selected from C; word is not in 
% cell array usedWords.
% updatedUsedWords is a cell array of strings; it is usedWords with 
% one extra cell containing word.
% Assume C contains many more different strings than usedWords does.


repeat = 1;
while repeat == 1
    a = ceil(rand*length(C));
    word = C{a}; %randomly selected from C
    numberOfMatches = 0;
    for i = 1:length(usedWords)
        if strcmp(word,usedWords(i)) %find matches and count them
            numberOfMatches = numberOfMatches + 1;
        end    
    end
    if numberOfMatches == 0
        repeat = 0; %unique, so end loop
    else
        repeat = 1; %already used, so continue loop
    end
end
function [found, tf] = findLetterInWord(let, word)
% Locate a letter (let) in a word (word), regardless of case.
% let is a char scalar. word is a 1-d char array (string).
% found is 1 if the letter is found; otherwise found is 0.
% tf is a vector that has the same length as word; for each valid index k,
% tf(k) is 1 if word(k) is let, regardless of case; otherwise tf(k) is 0.
tf = zeros(1,length(word)); %tf is all zeros, ones will be added later
found = 0;
for i = 1:length(word)
    if strcmp(upper(let), upper(word(i))
        found = 1; %letter found
        tf(i)=1; %replace 1 in position of letter in tf
    end
end
end
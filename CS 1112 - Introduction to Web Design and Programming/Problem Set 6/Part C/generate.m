function s = generate(s, r)
% s and r are strings.
% Replace each ’D’ in string s with string r. Return the resulting string.
% (This corresponds to applying the production rule to get the next
% generation of the incoming string s.)
if (length(s)==0) % Base case: nothing to do
    return
else
    if (s(1)~='D') %character does not match 'D'
        % return string is s(1) and remaining s with char c replaced
        s = [s(1) generate(s(2:length(s)),r)];
    else %character is 'D'
        % return string is just the remaining s with char r replaced
        s = [r generate(s(2:length(s)),r)];
    end
end
end
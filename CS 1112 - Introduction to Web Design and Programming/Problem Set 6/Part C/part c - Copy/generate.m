function s = generate(s, r, q)
% s and r are strings.
% Replace each ’A’ in string s with string r. 
%Replace each ’B’ in string s with string q.
%Return the resulting string.
% (This corresponds to applying the production rule to get the next
% generation of the incoming string s.)
if (length(s)==0) % Base case: nothing to do
    return
else
    if (s(1)=='A')
        s = [r generate(s(2:length(s)),r,q)];
    elseif (s(1)=='B')
        s = [q generate(s(2:length(s)),r,q)];
    else
        s = [s(1) generate(s(2:length(s)),r,q)];
    end
end
end
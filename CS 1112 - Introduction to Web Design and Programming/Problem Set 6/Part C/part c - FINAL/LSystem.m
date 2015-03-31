function s = LSystem(s, r, g)
% Generate an L-system string recursively.
% s (string) is the current state.
% r (string) is the production rule.
% g (non-negative integer) is the number of generations.
% Generate the L-system by applying the production rule r for g generations.
if (g==0)
    return
else
    g=g-1; %decrease count
    s = LSystem(generate(s, r), r, g);
end
end
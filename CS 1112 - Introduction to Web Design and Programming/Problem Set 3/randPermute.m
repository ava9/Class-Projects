function nums = randPermute(n)
nums = zeros(1,n);
% nums is a uniformly random permutation of 1:n
v = [1:n];
for k = n:-1:2              %setting up a backward loop
    x = floor(1+(rand*(k)));  %random number between 1 and k
    c = v(k);               %}
    v(k) = v(x);            %}switch v(k) with v(x)
    v(x) = c;               %}    
end
nums = v;
%disp(nums)
end
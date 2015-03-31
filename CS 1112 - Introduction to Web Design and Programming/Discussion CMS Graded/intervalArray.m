function Inters= intervalArray(n)
% Generate n random Intervals.  The left and right ends of each interval is
% in (0,1)

for k= 1:n
   randVals= rand(1,2);
   randVals= sort(randVals);
   Inters(k)= Interval(randVals(1),randVals(2));
   disp(Inters(k))  % call disp method on Inters(k), not Inters
end


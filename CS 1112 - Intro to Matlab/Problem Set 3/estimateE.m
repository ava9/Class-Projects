function myE = estimateE(N,T)
% myE is the estimated value of e obtained by simulating the hat matching game.
% There are N hats, and T trials of the game are simulated to obtain p0, the
% probability that no guest gets back her/his hat. myE is 1/p0
original = [1:N];
SwitchCount = 0;
count = 0;
for k = 1:T
    nums = randPermute(N);
    for x = 1:N
        if original(x) == nums(x)
            SwitchCount = SwitchCount +1;
        end
        if (SwitchCount==0)
            count = count +1;
        end
     SwitchCount = 0;
    end
end
pknot=(count/(N*T));
myE = (1/pknot);
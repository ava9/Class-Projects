function [rAve, cAve] = averagesAtMin(M)
% Let r and c be the row and column indices of the minimum value in uint8 matrix M.
% rAve is the mean of the values in row r of matrix M.
% cAve is the mean of the values in column c of matrix M.
% rAve and cAve should be uint8 scalars (round as appropriate).

[nr nc] = size(M); %nr=number of rows, nc=number of columns
LowestInM = inf; %set to inf so that the first num checked is lower
LocationLowest = zeros(1,2); %[0,0] created
%iterate through entire matrix to find minimum value and location
for i = 1:nr %1 to number of rows
    for j = 1:nc %1 to number of columns
        if M(i,j) < LowestInM %algorithm to find minimum value
            r = i; c = j;
            LowestInM = M(i,j);
        end
    end
end
rSum = sum(double(M(r,:))); %sum of rows
cSum = sum(double(M(:,c))); %sum of columns
rAve = uint8(rSum/nr); %averages of rows
cAve = uint8(cSum/nc); %average of columns
end
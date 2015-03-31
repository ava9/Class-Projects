% Aditya Agashe
% CS 1112 - 001 
% Professor: Dr. Daisy Fan
% Problem Set 1: Question 1 : Computing Square Roots
% A = Area of Rectangle (User Input) 
% L = Length of Rectangle
% W = Width of Rectangle

A = input('Enter a positive number <100: ');
L = A;
W = A/L;
fprintf('Building increasingly square rectangles with area %2.6f.\n', A)
fprintf('No.   Length             Width\n')
fprintf('----------------------------------------\n')
fprintf('1     %2.13f   %2.13f\n', L, W)
L = ((L + (A/L))/2);
W = A/L;
fprintf('2     %2.13f   %2.13f\n', L, W)
L = ((L + (A/L))/2);
W = A/L;
fprintf('3     %2.13f   %2.13f\n', L, W)
L = ((L + (A/L))/2);
W = A/L;
fprintf('4     %2.13f   %2.13f\n', L, W)
L = ((L + (A/L))/2);
W = A/L;
fprintf('5     %2.13f   %2.13f\n', L, W)
L = ((L + (A/L))/2);
W = A/L;
fprintf('6     %2.13f    %2.13f\n', L, W)
L = ((L + (A/L))/2);
W = A/L;
fprintf('7     %2.13f    %2.13f\n', L, W)
fprintf('\nThe square root of %2.6f is approximately %1.3f.\n', A, L)
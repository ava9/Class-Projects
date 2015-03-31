% Aditya Agashe
% CS 1112 - 001 
% Professor: Dr. Daisy Fan
% Problem Set 1: Question 3: myQuadratic
% Minimum and Maximum of the quadratic f(x)=ax^2 + bx + c on the interval [L,R]
a = input('Enter a: ');
b = input('Enter b: ');
c = input('Enter c: ');
L = input('Enter L: ');
R = input('Enter R (L<R): ');

%algorithm to find minimum
xc = ((-b)/(2*a));
if ((xc>=L) && (xc<=R))
    %Minimum at Critical Point
    fxcmin = ((a*(xc*xc))+(b*xc)+(c));
    fprintf('Minimum Value of F(x): %.2f\n', fxcmin)
elseif (xc<L)
    %Minimum at L
    fLmin = ((a*(L*L))+(b*L)+(c));
    fprintf('Minimum Value of F(x): %.2f\n', fLmin)
else
    %Minimum at R
    fRmin = ((a*(R*R))+(b*R)+(c));
    fprintf('Minimum Value of F(x): %.2f\n', fRmin)
end

%algorithm to find maximum
if ((xc<L)&& (xc>R))
    %Maximum at Critical Point
    fxcmax = ((a*(xc*xc))+(b*xc)+(c));
    fprintf('Maximum Value of F(x): %.2f\n', fxcmax)
elseif (xc>=L)
    %Maximum at L
    fLmax = ((a*(L*L))+(b*L)+(c));
    fprintf('Maximum Value of F(x): %.2f\n', fLmax)
else 
    %Maximum at R
    fRmax = ((a*(R*R))+(b*R)+(c));
    fprintf('Maximum Value of F(x): %.2f\n', fRmax)
end

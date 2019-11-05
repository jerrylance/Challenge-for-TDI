function Challenge2
% TDI challenge 
% Zeyu Liu
% 11/2/2019
% Consider a grid in d-dimensional space. There are n grid lines in each 
% dimension, spaced one unit apart. We will consider a walk of m steps from
% grid intersection to grid intersection. Each step will be a single unit
% movement in any one of the dimensions, such that it says on the grid. 
% We wish to look at the number of possible paths from a particular starting
% location on this grid.

% Consider the case where d=4, n=10, and m=10.
% How many valid walks start from the corner (0, 0, 0, 0)?
%d = 4;
%n = 10;
%m = 10;
format long;disp(pi);
% Use city Block distance thinking to caculate 10+,9+1-,8+2-,...,5+5-

a = 4^10;
y0 = 4^9*3;
y1 = nchoosek(10,1)*a-4^9;
y2 = nchoosek(10,2)*a-4^9-4^9-4^8;
%y3 = nchoosek(10,3)*a-err;
%y4 = nchoosek(10,4)*a-err;
y5 = 1/2*nchoosek(10,5)*a;

%with visual value y8=y2,y9=y1,y10=y0,It's look like Gaussian distribution
x =[1,2,3,6,9,10,11];
y = [y0,y1,y2,y5,y2,y1,y0];
% plot(x,y);
% pause;
% fit the plot
% use 'cftool'command to generate Gaussian fit, and generate Code.

[xData, yData] = prepareCurveData( x, y );
% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [132120576 6 1.27466218485303];

% Fit model to data.
[fitresult, ~] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'valid walks' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', 'valid walks', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on
pause;

% from the fit plot we can get
y0 = 786432;
y1 = 10223616;
y2 = 46596096;
y3 = 79020000;
y4 = 117300000;
y5 = 132120576;
Y11 = y0+y1+y2+y3+y4+y5 % 386046720

%Consider the case where d=4, n=10, and m=10. Consider the count of valid 
% walks associated with each possible starting position. What is the ratio
% of the highest count of valid walks to smallest count of valid walks?
% infer the start point at (5,5,5,5) we can get:

a = 4^10;
y0 = 4^4*3^4*2^2;
%y1 = nchoosek(10,1)*a-err;
%y2 = nchoosek(10,2)*a-err;
y3 = nchoosek(10,3)*a-4^9-4^9-4^8;
y4 = nchoosek(10,4)*a-4^9;
y5 = nchoosek(10,5)*a;

%with visual value y8=y2,y9=y1,y10=y0,It's look like Gaussian distribution
x =[1,4,5,6,7,8,11];
y = [y0,y3,y4,y5,y4,y3,y0];
% plot(x,y);
% pause;

[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [264241152 6 1.06823722305862];

% Fit model to data.
[fitresult, ~] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'valid walks' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', 'valid walks', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on

% from the fit plot we can get
y0 = 82944;
y1 = 13180000;
y2 = 48980000;
y3 = 125239296;
y4 = 219938816;
y5 = 264241152;
Y12 = y0+y1+y2+y3+y4+y5 %671662208;
Ration1 = Y12/Y11

% %Consider the count of valid walks associated with each possible starting 
% position. What is the ratio of the standard deviation of the number of 
% valid walks to the mean of the number of valid walks?
% because from all start fit , the model will be gaussian distribution,
% the std and mean of all position maybe use linear model or 
% norm distribution to estimate. To reduce the difficulty, I use linear
% model here
R12 = std([Y12,Y11])/mean([Y12,Y11])

pause;

%d = 8;
%n = 12;
%m = 12;

a = 8^12;
y0 = 8^11*7;
y1 = nchoosek(12,1)*a-8^11;
y2 = nchoosek(12,2)*a-8^11-8^11-8^11;
%y3 = nchoosek(12,3)*a-err;
%y4 = nchoosek(12,4)*a-err;
%y5 = nchoosek(12,5)*a;
y6 = 1/2*nchoosek(12,6)*a;

%with visual value y10=y2,y1=y1,y12=y0,It's look like norm distribution
x =[1,2,3,7,11,12,13];
y = [y0,y1,y2,y6,y2,y1,y0];
% plot(x,y);
% pause;

[xData, yData] = prepareCurveData( x, y );
% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.995399083321845;

% Fit model to data.
[fitresult, ~] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'valid walks' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', 'valid walks', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on
pause;

% from the fit plot we can get
y0 = 60130000000;
y1 = 816040000000;
y2 = 4509700000000;
y3 = 12000000000000;
y4 = 21010000000000;
y5 = 28535000000000;
y6 = 31748000000000;
Y21 = y0+y1+y2+y3+y4+y5+y6 % 98679000000000;

% Consider the case where d=8, n=12, and m=12. Consider the count of valid 
% walks associated with each possible starting position. What is the ratio
% of the highest count of valid walks to smallest count of valid walks?
% I infer the start point at (6,6,6,6) we can get:

a = 8^12;
y0 = 8^5*7^4*6^3;
%y1 = nchoosek(12,1)*a-err;
%y2 = nchoosek(12,2)*a-err;
%y3 = nchoosek(12,3)*a-err;
y4 = nchoosek(12,4)*a-8^11-8^11-8^11;
y5 = nchoosek(12,5)*a-8^11;
y6 = nchoosek(12,6)*a;

%with visual value y10=y2,y1=y1,y12=y0,It's look like norm distribution
x =[1,5,6,7,8,9,13];
y = [y0,y4,y5,y6,y5,y4,y0];
% plot(x,y);
% pause;

[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [63496796504064 7 1.19461314550633];

% Fit model to data.
[fitresult, ~] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'valid walks' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', 'valid walks', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on

% from the fit plot we can get
y0 = 16994000000;
y1 = 1272000000000;
y2 = 5200000000000;
y3 = 15550000000000;
y4 = 33990000000000;
y5 = 54417000000000;
y6 = 63497000000000;
Y22 = y0+y1+y2+y3+y4+y5+y6  %173940000000000;

Ration2 = Y22/Y21
% %Consider the count of valid walks associated with each possible starting 
% position. What is the ratio of the standard deviation of the number of 
% valid walks to the mean of the number of valid walks?
% because from all start fit , the model will be gaussian distribution,
% the std and mean of all position maybe use linear model or 
% norm distribution to estimate. To reduce the difficulty, I use linear
% model here
R12 = std([Y22,Y21])/mean([Y22,Y21])


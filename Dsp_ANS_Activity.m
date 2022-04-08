% Activity "Noise Cancellation using LMS Algorithm.."

clear;close;clc;
%Generating Desired Signal
t = 0.001:0.001:1;
fm = 50;
D = 2*sin(2*pi*fm*t);

% Generating Signal Corrupted with Noise
n = numel(D);
A = D(1:n)+0.9*randn(1,n);      % desired signal + 90% noise signal

%LMS Algorithm
M = 25;   
w = zeros(1,M);
wi = zeros(1,M);
E = [];
u = 0.0005;   %for conversion of LMS algorithm (Step size)

%den = A(1,:)*A(1,:)'+0.0001;
for i = M:n
    E(i) = D(i)-wi*A(i:-1:i-M+1)';
    wi = wi+ 2*(u)*E(i)*A(i:-1:i-M+1);
end

 %Estimation of the signa
l
 
 Est = zeros(n,1);
 for i = M:n
     j = A(i:-1:i-M+1);
     Est(i) = ((wi)*(j)');
 end
 
 % Computing the error signal
 Err = Est'-D;
 
 %singal Output
 
 subplot(4,1,1),plot(D);
 title('Desired Signal');
 subplot(4,1,2),plot(A);
 title('Signal Corrupted with Noise');
 subplot(4,1,3),plot(Est);
 title('Estimation Signal');
 subplot(4,1,4),plot(Err);
 title('Error Signal');
 
 
 




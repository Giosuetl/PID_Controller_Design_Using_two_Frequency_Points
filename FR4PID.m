%Define the input and output variables for the MATLAB function. Enter the following
%program into the file:
function [Kc,tauI,tauD]=FR4PID(beta,taucl,w1,w2,Gjw1,Gjw2,K)
%Calculate the frequency response of the control sensitivity function at 𝜔1 and 𝜔2.
%Continue entering the following program into the file:
j=sqrt(-1);
Sujw1=(j*w1*taucl/beta+1)/(K*(j*w1*taucl+1));
Sujw2=(j*w2*taucl/beta+1)/(K*(j*w2*taucl+1));
%Calculate the frequency response of the complementary sensitivity function T(j𝜔) and
%the desired open-loop frequency response Ld(j𝜔) at 𝜔1 and 𝜔2. Continue entering the
%following program into the file:Calculate the frequency response of the complementary sensitivity function T(j𝜔) and
%the desired open-loop frequency response Ld(j𝜔) at 𝜔1 and 𝜔2. Continue entering the
%following program into the file:
Tjw1=Sujw1*Gjw1;
Ljw1=Tjw1/(1-Tjw1);
Tjw2=Sujw2*Gjw2;
Ljw2=Tjw2/(1-Tjw2);
%Calculate X(j𝜔1) and X(j𝜔2) using (8.12) and (8.13). Continue entering the following
%program into the file:
Xjw1=j*w1*Ljw1/Gjw1;
Xjw2=j*w2*Ljw2/Gjw2;
%Calculate the controller coefficients c2, c1 and c0 using X(j𝜔1) and X(j𝜔2). Continue
%entering the following program into the file:
c1=imag(Xjw1)/w1;
c2= -(real(Xjw2) - real(Xjw1))/(w2^2 -w1^2);
c0=c2*w1^2+real(Xjw1);
%Finally, calculate the PID controller parameters, Kc, 𝜏I and 𝜏D. Continue entering the
%following program into the file:
Kc=c1;
tauI=c1/c0;
tauD=c2/c1;

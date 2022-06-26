%Define the system under test. Enter the following program into the file:
delay=20;
K=0.4;
num=K;
tau1=2;
tau2=2;
tau3=1;
den1=conv([tau1 1],[tau2 1]);
den=conv(den1,[tau3 1]);
w=0.001:0.01:1;
Gjw0=freqs(num,den,w).*exp(-j*w*delay);
%plot the real and imaginary parts of ’Gjw0’ as before to find wpi/2=0.061 and wpi = 0.131.
%sustituir i*w en G(s)
%1.Obtener la parte real de G(i*w) (por facilidad recurrir a wolframalpha.com)
%2.Igualar a cero y obtener w (por facilidad recurrir a wolframalpha.com)
%These two frequencies will be used to find the PID controller parameters. We need to
%add time delay to the frequency calculation. Continue entering the following program
%into the file:
w1=[0.061 0.131];
Gjw=freqs(num,den,w1).*exp(-j*w1*delay);
%We choose 𝛽 = 5 and 𝜏cl = 5, then use the function ’FR4PID.m’ to calculate the PID
%controller parameters. Continue entering the following program into the file:
taucl=5;
beta=5;
[Kc,tauI,tauD]=FR4PID(beta, taucl,w1(1),w1(2),Gjw(1),Gjw(2),K);

Kc
tauI
tauD



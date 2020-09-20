% Get some audio
load handel; 

% Half Speed
yslow =pvoc(y,.5,1024); 
% Compare original and resynthesis 
sound(y,Fs);
sound(yslow,Fs);


% Twice as Fast
yfast =pvoc(y,2,1024); 
% Compare original and resynthesis 
sound(y,Fs);
sound(yfast,Fs);
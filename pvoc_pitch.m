% Get some audio
load handel; 

% Pitch up a Fifth
ypvoc =pvoc(y, 0.66666); 
ypitch = resample(ypvoc,2,3); % NB: 0.666 = 2/3 
sound(y,Fs);
sound(ypitch, Fs);
sound(y(1:length(ypitch)) + ypitch, Fs);

% Pitch up an octave 
ypvoc =pvoc(y, 0.5); 
ypitch = resample(ypvoc,1,2);
sound(y,Fs);
sound(ypitch, Fs);
sound(y(1:length(ypitch)) + ypitch, Fs);


% Pitch down an octave
ypvoc =pvoc(y, 2); 
ypitch = resample(ypvoc,2,1);  
sound(y,Fs);
sound(ypitch, Fs);
sound(y + ypitch(1:length(y)), Fs);
load handel; % Get some audio

% stft parameters (can vary)
n = 512;
nhop = n/4;
Y = stft(y,n,n,nhop);

% Make Spectrogram
specy = abs(Y)/n;

% set left-hand coordinate origin
imshow((flipud(255*specy)));
colormap(jet); %color display

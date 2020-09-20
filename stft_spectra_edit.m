close all, clear all;

load handel; % Get some audio


figure(1)
plot(y);
title('Orignal Wav, Y');

reply = input('Press any key to play sound? ');
sound(y, Fs)

% stft parameters (can vary)
n = 1024;
nhop = n/4;
Y = stft(y,n,n,nhop);

% Edit example cut a chunk out of Y
Yedit = Y;
Yedit(100:400,:) = 0;

figure(2)
imshow(255*abs(Yedit)/n)
colormap('hsv')
title('Edited Yedit Spectrogram')

% Remake sound
yedit = istft(Yedit,n,n, nhop);

reply = input('Press any key to play edited sound? ');
sound(yedit,Fs)

figure(3)
plot(yedit)
title('Yedit')

figure(4)

plot(yedit(1:length(yedit)) - y(1:length(yedit))')
title('Yedit residual')

% Play residual
reply = input('Press any key to play residual sound? ');
sound(yedit(1:length(yedit)) - y(1:length(yedit))',Fs);

% Edit example cut a chunk out of Y

Yedit = Y;
Yedit(:, 150:250) = 0;

figure(5)
imshow(255*abs(Yedit)/n)
colormap('hsv')
title('Edited Yedit Spectrogram')

% Remake sound
yedit = istft(Yedit,n,n, nhop);

reply = input('Press any key to play original sound? ');
sound(y,Fs);

reply = input('Press any key to play edited sound? ');
sound(yedit,Fs)


figure(6)
plot(yedit)
title('Yedit')

figure(7)
plot(yedit(1:length(yedit)) - y(1:length(yedit))')
title('Yedit residual')

% Play residual

reply = input('Press any key to play residual sound? ');
sound(yedit(1:length(yedit)) - y(1:length(yedit))', Fs);


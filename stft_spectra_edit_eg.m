close all, clear all;

[y,Fs] = audioread('handel_hum.wav'); % Get some audio


reply = input('Press return to play sound? ');

figure(1)
plot(y);
title('Orignal Wav, Y');



sound(y, Fs)

% stft parameters (can vary)
n = 1024;
nhop = n/4;
Y = stft(y,n,n,nhop);

[yn, ym] = size(Y);

figure(2)
imshow(255*abs(Y)/n)
colormap('hsv')
title('Y Input Spectrogram')


% Edit example cut a chunk out of Y Hum in 
%Rows 20:22 around 160HZ (= 20*Fs (= 8192)/ n (=1024) )

Yedit = Y;

Yresidual = zeros(yn,ym);
Yresidual(20:22,:) = Y(20:22,:);
Yedit(20:22,:) = 0;


reply = input('Press return to play edited sound? ');

figure(3)
imshow(255*abs(Yedit)/n)
colormap('hsv')
title('Edited Yedit Spectrogram')


figure(4)
imshow(255*abs(Yresidual)/n)
colormap('hsv')
title('Filtered Hum Spectrogram')

% Remake sound
yedit = istft(Yedit,n,n, nhop);

sound(yedit,Fs)


reply = input('Press return to play residual sound? ');

figure(5)
plot(yedit)
title('Yedit')


figure(6)

plot(yedit(1:length(yedit)) - y(1:length(yedit))')
title('Yedit residual')

% Play residual
sound(yedit(1:length(yedit)) - y(1:length(yedit))',Fs);




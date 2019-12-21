%% 长度为50ms 3-8KHZ  FS= 44100
%% chirp信号生成的第一种方法（matlab自带）
t=0: 1/5e6 :5119/5e6;                    % 采样率是5MHZ
y=chirp(t,0,5119/5e6,125e3);% 第一个参数表示时间长度，第二个参数表示当t=0s时对应的频率，第三个和第四个参数为当t=0.05s时对应的频率
figure();
subplot(2,1,1);
plot(y);
subplot(2,1,2);
spectrogram(y,256,128,256,5e6,'yaxis'); 

% w = zeros(5120,1);
% for i = 1 :5120
%     w(i) = (i-1)/5120*125e3;
%     yi(i) = y(i)*cos(pi/10*i-pi/20);
% end
% stem(yi)
% % y_I = 

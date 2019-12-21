clc
clear

fs=5e3;
filename = 'D:\lora\data\test\No2_3';
[Data_Real,Data_Imag,Data_Complex] = read_data(filename);%导入数据
valuefu=Data_Complex(300000:600000);%bigp2p2_3
% 
% filename = 'D:\lora\data\train\Nob2_3';
% filename = 'D:\lora\Test_Data';
% [Data_Real,Data_Imag,Data_Complex] = read_data(filename);%导入数据
% valuefu=Data_Complex(7500000:10000000);%bigp2p2_3

figure();
% [S,F,T]= spectrogram(valuefu,800,600,1024,fs,'yaxis');
% imagesc(T, F, log10(abs(S)));
[~,~,~,pxx,fc,tc] = spectrogram(valuefu,800,600,1024,fs,'yaxis', ...
    'MinThreshold',-55);
plot(tc(pxx>0),fc(pxx>0),'.')
% spectrogram(valuefu,800,600,1024,fs,'yaxis')
title('spectrogram');
xlabel('time(second)');
ylabel('frequency(Hz)');

% % 基本参数
% fa = [ 50 125000 ];    % 扫描频率上下限
% fs = 6400;          % 采样频率
%  
% % 分辨率相关设定参数
% te = 1;             % [s] 扫频时间长度
% fre = 8;            % [s] 频率分辨率
% tre = 0.002;        % [Hz] 时间分辨率
%  
% % Chirp 信号生成
% t = 0:1/fs:te;                  % [s] 时间序列
% sc = chirp(t,fa(1),te,fa(2));   % 信号生成
%  
% % 分辨率相关输入参数
% nsc = floor(fs/fre);
% % nov = floor(nsc-(fs*tre));
% nov = floor(nsc*0.9);
% nff = max(256,2^nextpow2(nsc));
% 
% subplot(1,3,2)                            % 绘制 Matlab 函数结果
%    [s,W,T]= spectrogram(valuefu,hamming(nsc),nov,nff,fs,'yaxis');
%         % Turn into DFT in dB
%         s1 = abs(s/nff);
%         s2 = s1(1:nff/2+1,:);             % Symmetric results of FFT
%         s2(2:end-1,:) = 2*s2(2:end-1,:);  % Add the value of the other half 
%         s3 = 20*log10(s2);                % Turn sound pressure into dB level
%     my_pcolor(W,T,s3 )
%     caxis([-130.86,-13.667]);
%     title('Matlab 自带函数');
%     xlabel('时间 second');
%     ylabel('频率 Hz');
% subplot(1,3,3)                            % 两者误差
%     my_pcolor(W,T,20*log10(abs(10.^(s3/20)-10.^(S/20))))
%     caxis([-180,-13.667]);
%     title('error');
%     ylabel('频率 Hz');
%     xlabel('时间 second');
% suptitle('Spectrogram 实现与比较');

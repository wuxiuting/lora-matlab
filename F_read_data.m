function [Data_Real,Data_Imag,Data_Complex] = F_read_data(filename)

fileID = fopen(filename);
Data_Temp = fread(fileID,inf,'float32');

Get_Data_Length = floor(length(Data_Temp)/2);

Data_Real = zeros(Get_Data_Length,1);
Data_Imag = zeros(Get_Data_Length,1);


for n = 1:Get_Data_Length
    Data_Real(n,1) = Data_Temp((n-1)*2+1,1);
    Data_Imag(n,1) = Data_Temp(n*2,1);
%     Data(n,1)= sqrt(Data_Real(n,1)^2+Data_Imag(n,1)^2);
end
Data_Complex = Data_Real + Data_Imag * 1i;

% ����ԭʼ���ݲ���ͼ
% figure();
% x = 1/5000000:1/5000000:Get_Data_Length/5000000;
% y = Data_Real; 
% plot(x,y);
% 
% �ҳ�����Ƶ��
% P = nextpow2(Get_Data_Length);
% NFFT = 2^P;  %��ʱ���źŲ��뵽2���������ݣ���������Ҷ�任
% y = fft(Data_Complex,NFFT)/Get_Data_Length;  %˫����
% f = 5e6/2*linspace(0,1,NFFT/2+1);  %������
% figure,plot(f,2*abs(y(1:NFFT/2+1)));
% % f = 5e6*linspace(0,1,NFFT);
% % figure,plot(f,abs(y(1:NFFT)));
% title('Amplitude spectrum');
% xlabel('Frequency(MHz)');
% ylabel('|Amplitude(f)|');
% 
% %��Ƶ��ͼ
% freq=fftshift(fft(Data_Complex));
% x_label=-Get_Data_Length/2:1:Get_Data_Length/2-1;
% ff=(x_label*5000./Get_Data_Length+433e3)/1000;
% figure,plot(ff,abs(freq));
% xlabel('Frequency(MHz)');


end

fs=5e6;
filename = 'D:\lora\data\test\No2_3';
[Data_Real,Data_Imag,Data_Complex] = read_data(filename);%导入数据

%valuefu=Data_Complex(4204992:4359950);%bigp2p2_3
valuefu=Data_Complex(300000:600000);%bigp2p2_3
% figure,plot(real(valuefu));
% valuefu=Data_Complex(1704628:1956495);
%valuefu=valuefu(19515:19854);
% valuefu=valuefu(19515:19854);
% valueshi=Data_Real(4204942:4359999);%选取其中一段有效信号
% valuexu=Data_Imag(4204942:4359999);%选取其中一段有效信号
% figure,plot(real(valuefu));
% frecSpectrum=fft(valueshi);%画实部的频谱
N=length(valuefu);
n=0:N-1;
f1=fs*n/N;%将FFT点数转换成成实际频率
f2=fs*n/N-fs/2;%将频率范围从0-fs转换为-fs/2~fs/2
frecSpectrum=fft(valuefu,N);%画复信号的频谱
frecSpectrumshift=fftshift(frecSpectrum);
frecSpectrum=abs(frecSpectrum);
frecSpectrumshift=abs(frecSpectrumshift);
% figure,plot(f1,frecSpectrum);
figure,plot(f2,frecSpectrumshift);

instantaneousPhase=angle(valuefu);
% figure,plot(instantaneousPhase);%画瞬时相位  %,shading('interp')
diffPhase=diff(instantaneousPhase);
for i=1:length(diffPhase)
    if diffPhase(i)<-pi
        diffPhase(i)=diffPhase(i)+pi*2;
    else
        if diffPhase(i)>pi
            diffPhase(i)=diffPhase(i)-pi*2;
        end
    end
end
instantaneousFrequency = (diffPhase / (2.0 * pi) * fs);
I = find(instantaneousFrequency>80000);
instantaneousFrequency(I)= 0;
I1 = find(instantaneousFrequency<-80000);
instantaneousFrequency(I1)= 0;
figure,plot(instantaneousFrequency);%画瞬时频率

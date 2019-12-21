validDataLength = 22000;
sectionInterval= 300000;
thre = 0.05;
filename = "D:\lora\data\train\No1_1";%从单个文件导入数据
[Data_Real,Data_Imag,Data_Complex] = read_data(filename);
% figure,plot(abs(Data_Complex));    % figure,plot(Data_Real);  
datatype = Data_Real;
heads = findframeheads_2(datatype,thre,sectionInterval);%找出有效数据段的起始点
% plot_timeFreq(valid_points,Data_Complex);
datanum = length(heads);
datas = [];
for count = 1:datanum-1
    %将IQ两路信号的有效数据段分别归一化
    %★★★★★可修改参数★★★★★
    data1 = Data_Real(heads(count):heads(count)+validDataLength);%根据有效数据段长度修改
    data1 = data1';
    data1 = mapstd(data1);  %标准化处理，均值为0，方差为1
    data1 = data1';
    data2 = Data_Imag(heads(count):heads(count)+validDataLength);%根据有效数据段长度修改
    data2 = data2';
    data2 = mapstd(data2);
    data2 = data2';
    %plot(data2,'b+-');
    center = xingzuo(data1,data2,validDataLength,[filename,'_',num2str(count)]);
    datas = center;
    datas(all(datas==0,2),:)=[];  %删除数据中的全0行
    center = sum(datas)/(length(datas)-length(v)/2);
    figure;axis on;

    plot(datas(:,2),1025-datas(:,1),'k*');
    hold on;
    plot(center(1,2),1025-center(1,1),'r+');
    axis([0,1025,0,1025]);
end
[row,col,v] = find(~datas);
% center = sum(datas)/(length(datas)-length(v)/2);

% [ Rows Cols ] = size( datas );
% for i = 1 : Rows
%     if datas(i,1)<250||datas(i,1)>650
%         datas(i,:)=0;
%     end
% end
% % datas(all(datas==0,2),:)=[];  %删除数据中的全0行
% % center = sum(datas)/(length(datas)-length(v)/2);
% % figure;axis on;
% % 
% % plot(datas(:,2),1025-datas(:,1),'k*');
% % hold on;
% % plot(center(1,2),1025-center(1,1),'r+');
% % axis([0,1025,0,1025]);
% clustering(center1,center2,center3,centerb);
% ashifu=abs(Data_Real);
% axufu=abs(Data_Imag);
% fudu=sqrt(Data_Real.^2+Data_Imag.^2);
% plot(Data_Real(1:5000000));%画实部，能看到初始的正弦波（疑似启动时的脉冲）
% subplot(121);plot(fudu(start:start+20000));

% shiyu=Data_Real(33606:34633);
% shiyu=shiyu';

% figure,plot(shiyu);
% figure,plot(shiyu(279:743));
% shiyu=shiyu-0.183;
% plot(shiyu);
% pinyu=abs(fft(shiyu(279:743)));
% figure,plot(pinyu);
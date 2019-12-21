% clear all
% close all
% clc
% rawSavePath = '/home/wxt/data/raw/';
% 
% list=dir(fullfile(rawSavePath));
% fileNum=size(list,1)-2;  % 
% filenames=strings(fileNum,1);
% num = [0;];
% for k=1:fileNum+2
% 	filename = list(k).name;  % 
%      if( isequal( list(k).name, '.' )||...
%          isequal( list(k).name, '..')||...
%          list(k).isdir)               % 
%          continue;
%      end
%      num = [num;str2num(filename);];     
% end
% rawIndex = max(num)+1;
% file = [rawSavePath,num2str(rawIndex)];
% fp=fopen(file,'wb');
% raw = [5 125  1215  1215  154];   % raw is input.
% fwrite(fp,raw,'float32')
% fclose(fp);
rawSavePath = '/home/rfid/data/realtime/';
file = '/home/rfid/data/receive';
% validDataLength = 220000;
% sectionInterval= 300000;
% thre = 0.5;
[Data_Real,Data_Imag,Data_Complex] = F_read_data(file);
validDataLength = length(Data_Real);
% datatype = Data_Real;
% heads = findframeheads_folder(datatype,thre,sectionInterval);    %
% datanum = length(heads);
datas = [];
% for count = 1:datanum-1
data1 = Data_Real';%
data1 = mapstd(data1);
data1 = data1';
data2 = Data_Imag';
data2 = mapstd(data2);
data2 = data2';
%plot(data2,'b+-');
center = T_xingzuo(data1,data2,validDataLength,file);
fprintf('!! x=%.2f, y=%.2f\n', center(1), center(2));
%center
%     num2str(rawIndex)]);
% datas = [datas;center;];
% datas(all(datas==0,2),:)=[];
% center1 = [sum(datas(:,2))/length(datas),1025-sum(datas(:,1))/length(datas)]






% validDataLength = 220000;
% sectionInterval= 300000;
% thre = 0.5;
% % filename = 'D:\lora\data\smallNode\No1_2';
% dataPath='/home/wxt/data/test/No1_4'; 
% % dataPath='D:\lora\data\test\'; 
% 
% list=dir(fullfile(dataPath));
% fileNum=size(list,1)-2;  % 
% filenames=strings(fileNum,1);
% center1 = [];
% center2 = [];
% center3 = [];
% centerb = [];
% num = 0;
% % Ҫ���������ļ�
% for k=3:fileNum+2
% 	filename = list(k).name;  % ������ļ�������������ļ��У���Ҳ���������档
%      if( isequal( list(k).name, '.' )||...
%          isequal( list(k).name, '..')||...
%          list(k).isdir)               % �������Ŀ¼������
%          continue;
%      end
%      if filename(3)=='b'
%           validDataLength = 120000;
%           sectionInterval= 200000;
%           thre = 0.05;
%      end
%     file = [dataPath,filename];
%     [Data_Real,Data_Imag,Data_Complex] = read_data(file);
%     % figure,plot(abs(Data_Complex));    % figure,plot(Data_Real);  
%     datatype = Data_Real;
%     heads = findframeheads_2(datatype,thre,sectionInterval);    %�ҳ���Ч���ݶε���ʼ��
%     % plot_timeFreq(valid_points,Data_Complex);
%     datanum = length(heads);
%     datas = [];
%     for count = 1:datanum-1
%         %��IQ��·�źŵ���Ч���ݶηֱ��һ��
%         %��������޸Ĳ���������
%         data1 = Data_Real(heads(count):heads(count)+validDataLength);%������Ч���ݶγ����޸�
%         data1 = data1';
%         data1 = mapstd(data1);
%         data1 = data1';
%         data2 = Data_Imag(heads(count):heads(count)+validDataLength);%������Ч���ݶγ����޸�
%         data2 = data2';
%         data2 = mapstd(data2);
%         data2 = data2';
%         %plot(data2,'b+-');
%         center = xingzuo(data1,data2,validDataLength,[dataPath,'figure\',filename,'_',num2str(count)]);
%         datas = [datas;center;];
%         num = num +1;
%     end
% %     [row,col,v] = find(~datas);
%     datas(all(datas==0,2),:)=[];
%     if filename(3)=='1'
%         center1 = [center1;datas;];
%         %center1 = [center1;sum(datas)/(length(datas)-length(v)/2);];
%     end
%      if filename(3)=='2'
%          center2 = [center2;datas;];
% %         center2 = [center2;sum(datas)/(length(datas)-length(v)/2);];
%      end
%      if filename(3)=='3'
%          center3 = [center3;datas;];
% %         center3 = [center3;sum(datas)/(length(datas)-length(v)/2);];
%      end
%      if filename(3)=='b'
%          centerb = [centerb;datas;];
% %         centerb = [centerb;sum(datas)/(length(datas)-length(v)/2);];
%     end
% end
% num
% 
% %centers = [center1;center2;center3;centerb];
% [center_1,center_2,center_3,center_b] = clustering(center1,center2,center3,centerb);

validDataLength = 220000;
sectionInterval= 300000;
thre = 0.5;
dataPath='D:\lora\data\test\'; %从文件夹中读取多个数据文件

list=dir(fullfile(dataPath));
fileNum=size(list,1)-2;  % 减去2,是因为list包含了. 和 .. 路径
filenames=strings(fileNum,1);
% center_1 =
%        300.48       273.54
% center_2 =
%        515.35       249.29
% center_3 =
%        219.97       399.37
% center_b =
%        813.89       641.29
center_1 = [279.43       270.97];
center_2 = [508.73       179.52];
center_3 = [191.77       395.86];
center_b = [826.08       645.22];
% 要遍历所有文件
num = 0;
recong =0;
for k=3:fileNum+2
	filename = list(k).name;  % 这就是文件名，如果有子文件夹，则也包含在里面。
     if( isequal( list(k).name, '.' )||...
         isequal( list(k).name, '..')||...
         list(k).isdir)               % 如果不是目录则跳过
         continue;
     end
     if filename(3)=='b'
          validDataLength = 120000;
          sectionInterval= 200000;
          thre = 0.05;
     end
    file = [dataPath,filename];
    [Data_Real,Data_Imag,Data_Complex] = read_data(file);
    % figure,plot(abs(Data_Complex));    % figure,plot(Data_Real);  
    datatype = Data_Real;
    heads = findframeheads_2(datatype,thre,sectionInterval);    %找出有效数据段的起始点
    % plot_timeFreq(valid_points,Data_Complex);
    datanum = length(heads);
    datas = [];
    for count = 1:datanum-1
        %将IQ两路信号的有效数据段分别归一化
        %★★★★★可修改参数★★★★★
        data1 = Data_Real(heads(count):heads(count)+validDataLength);%根据有效数据段长度修改
        data1 = data1';
        data1 = mapstd(data1);
        data1 = data1';
        data2 = Data_Imag(heads(count):heads(count)+validDataLength);%根据有效数据段长度修改
        data2 = data2';
        data2 = mapstd(data2);
        data2 = data2';
        %plot(data2,'b+-');
        center = xingzuo(data1,data2,validDataLength,[dataPath,'figure\',filename,'_',num2str(count)]);
        text = [filename,'_',num2str(count)];
        disp(text);     %直接打印字符串 ，打印完会直接换行
        center(all(center==0,2),:)=[];  %去除空行
%         center_ = [sum(center(:,2))/length(center),1025-sum(center(:,1))/length(center)];
        center_ = [center(1,2),1025-center(1,1)];
        disp(center_)
        err1 = (center_(1,1)-center_1(1,1))^2+(center_(1,2)-center_1(1,2))^2;
        err2 = (center_(1,1)-center_2(1,1))^2+(center_(1,2)-center_2(1,2))^2;
        err3 = (center_(1,1)-center_3(1,1))^2+(center_(1,2)-center_3(1,2))^2;
        errb = (center_(1,1)-center_b(1,1))^2+(center_(1,2)-center_b(1,2))^2;
        err = [err1,err2,err3,errb];
        disp(err)
        [C,I] = min([err1,err2,err3,errb]);
        num = num+1;
        if I == 1
              disp("LoRa1");
              if filename(3)=='1'
                 recong = recong + 1;
              end
             else if I == 2
                  disp("LoRa2");
                  if filename(3)=='2'
                  recong = recong + 1;
                  end
                  else if I == 3
                        disp("LoRa3");
                        if filename(3)=='3'
                        recong = recong + 1;
                        end
                       else if I == 4
                            disp("LoRaB");
                            if filename(3)== 'b'
                             recong = recong + 1;
                            end
                           end
                      end
                 end
        end
    end
    
end

rate = recong/num

%centers = [center1;center2;center3;centerb];
    
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
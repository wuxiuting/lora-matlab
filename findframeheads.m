function heads = findframeheads(datatype)
%找同一个文件的多个帧头
Channeldata = datatype;
% plot(Channeldata);
% plot(Channeldata,'b+-');
%★★★★★可修改参数★★★★★
threshold = 0.008;%阈值
%heads=zeros(1,8);%建立一个空数组存放8个帧头
%heads=0;
ptr=1;
i=1;
while(ptr<length(Channeldata)-100)
     if abs(Channeldata(ptr))<threshold && abs(Channeldata(ptr+40))<threshold && abs(Channeldata(ptr+80))>threshold
         %if abs(Channeldata(ptr))<threshold && abs(Channeldata(ptr+1))<threshold && abs(Channeldata(ptr+2))>threshold&& abs(Channeldata(ptr+3))>threshold
          heads(i)=ptr+80;
          i=i+1;
          %★★★★★可修改参数★★★★★
          ptr=ptr+300000;%跳过该有效数据段，寻找下一个起始点
    end
     ptr=ptr+1;
end

end

%% lora小节点 阈值0.5，有效数据段长度220000,间隔300000
% 大节点阈值阈值0.05,有效数据段长度120000,间隔200000

%% 找到a、b的同步头
% a = [1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6];
% b = [1 2 3];
% for i =1:16
%     e(i) = a(i:i+2)*b'/sqrt(sum(a(i:i+2).^2)/sqrt(sum(b).^2));
% end
% find(e==max(e));
% stem(e);

%% 同步、自相关
filename = 'D:\lora\processing\p2p\Nob2_2';
[Data_Real,Data_Imag,Data_Complex] = read_data(filename);

t=0: 1/5e6 :5119/5e6;                    % 采样率是5MHZ
y=chirp(t,0,5119/5e6,125e3);% 第一个参数表示时间长度，第二个参数表示当t=0s时对应的频率，第三个和第四个参数为当t=0.05s时对应的频率

for i =1:length(Data_Complex)-5119
    e(i) = Data_Complex(i:i+5119).*y(1:5120)'/sqrt(sum(Data_Complex(i:i+5119).^2)/sqrt(sum(y(1:5120)).^2));
end
find(e==max(e));
stem(e);

% a = [1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6];
% b = [1 2 3];
% for i =1:16
%     e(i) = a(i:i+2)*b'/sqrt(sum(a(i:i+2).^2)/sqrt(sum(b).^2))/9;
% end
% find(e==max(e));
% stem(e);

%% disp打印输出命令

name = 'Alice';   
age = 12;
X = [name,' will be ',num2str(age),' this year.'];
disp(X)
%% matlab中如何删除矩阵中特定的几个元素
% a = [ 9 8 8 1 2
%     6 7 3 1 5
%     9 9 9 9 3
%     4 5 6 5 7
%     7 6 7 7 7 ];
% larger5 = a > 5; % 通过判断条件得到逻辑0 1矩阵
% [ Rows Cols ] = size( a );
% for i = 1 : Rows
%     for j = 1 : Cols 
% % 将矩阵中大于5的数置为0
%         if larger5(i,j)
%             a( i, j  ) = 0;
%         end
%     end
% end

%% Spectrogram with Threshold
% Fs = 1000;
% t = 0:1/Fs:2;
% y = chirp(t,100,1,200,'quadratic');
% [~,~,~,pxx,fc,tc] = spectrogram(y,kaiser(128,18),120,128,Fs, ...
%     'MinThreshold',-30);
% plot(tc(pxx>0),fc(pxx>0),'.')
%% 寻找矩阵元素并替换
% A=[8     1     6
%    3     5     7
%    4     9     2];
% I=find(A>5) %%找到A中所有大于5的元素
% A(I)=0 %%将A中所有大于5的元素替换为0

%% matlab 如何去掉矩阵中的全0行
% a=[1 2 3;0 0 0;2 1 6];
% all(a==0,2)  行返回1代表全0行，返回0代表非0行
% a(all(a==0,2),:)=[]  删除全0行

%% 取矩阵中最大的n个数
% 假设矩阵为a = [1 3 2,6 5 4]
% s=size(a)
% 先b=reshape(a , 1 ,s(1)*s(2))
% c=sort(b)
% 
% d=find(a>c(s-n))
% 
% d就是矩阵a最大n个值的索引 ，按照先列后行的顺序找的。 

%% 矩阵数据转换成灰度图像
% 首先把矩阵数据归一化
% A=(A-min(A(:)))/(max(A(:))-min(A(:)));
% 然后转换到[0 255]区间内
% 之后
% A=A*255；
% A=uint8(A);
% 这样就可以用imshow来显示了
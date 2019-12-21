function center = clustering_center_file(Plot_Table,filename)

min_n=min(min(Plot_Table));  %�ҳ��Ҷ�ͼ���е���Сֵ
max_n=max(max(Plot_Table));  %�ҳ��Ҷ�ͼ���е����ֵ
Plot_Table=Plot_Table./(max_n-min_n)*255;  %���Ҷ�ͼ��һ����0-255��Χ
i = imresize(uint8(Plot_Table),[1025,1025]);%�ֽ�ͼ��ֵȡ����תΪuint8�ͣ��ٵ�����1000��1000�ߴ�
% imwrite(i,[filename,'_gray','.jpg']);%����ͼ��Ϊ�ļ�

[x y]=find(Plot_Table==max(max(Plot_Table)));
center = [x,y];
% [M,N]=size(Plot_Table);
% thre = 0.95*max_n;
% center = [];
% for i=1:1:M
%     for j=1:1:N
%        if Plot_Table(i,j)>thre
%            center = [center;i,j;];
%        end
%     end
% end

% if max_n>150 || max_n<10
%     center = [0,0];
% end

return;
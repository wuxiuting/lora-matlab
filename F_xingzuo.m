function  center = F_xingzuo(DataI,DataQ,validDataLength,filename)
Differ_Interval = 5120;%��ּ��
%��������޸Ĳ���������
Process_Length = validDataLength;%�������Ч���ݶγ���

Process_DataI = DataI - mean(DataI);
Data_PowerI = sqrt(mean(Process_DataI.^2));%�󷽲��׼��
Process_DataI = Process_DataI / Data_PowerI;%��һ��

Process_DataQ = DataQ - mean(DataQ);
Data_PowerQ = sqrt(mean(Process_DataQ.^2));%�󷽲��׼��
Process_DataQ = Process_DataQ / Data_PowerQ;%��һ��

Process_Data_Plot = zeros(Process_Length - Differ_Interval,1);%�������ɵĸ���

for n = 1:1:Process_Length - Differ_Interval
    Process_Data_Plot(n,1) = Process_DataI(n,1)*Process_DataI(n+Differ_Interval,1)+Process_DataQ(n,1)*Process_DataQ(n+Differ_Interval,1) + 1i * (Process_DataQ(n,1)*Process_DataI(n+Differ_Interval,1)-Process_DataI(n,1)*Process_DataQ(n+Differ_Interval,1));
%     Process_Data_Plot(n,1) = Process_Data(n,1) + 1i * Process_Data(n+Differ_Interval,1);%���Differ_Interval��λ�õ������ɸ�ƽ�棬1i������λ
end

Plot_Table_Size = 512;%����ͼ��ķֱ���
%��������޸Ĳ���������
Plot_Table_Max = 3;%ȡProcess_Data_Plotʵ�����鲿�����ֵ
[Plot_Table] = F_Get_Data_Table(Plot_Table_Size, Plot_Table_Max, Process_Data_Plot, 0);
center = clustering_center_file(Plot_Table,filename);
DCTF_graytocolor(Plot_Table,1,filename);%���Ҷ�ͼתΪ��ɫͼ
return;
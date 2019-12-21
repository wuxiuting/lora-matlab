function filenames = read_folder(dataPath)

% dataPath='D:\lora\data\1\';
list=dir(fullfile(dataPath));
fileNum=size(list,1)-2;  % 减去2,是因为list包含了. 和 .. 路径
filenames=strings(fileNum,1);
% 要遍历所有文件
for k=3:fileNum+2
	processFile = list(k).name;  % 这就是文件名，如果有子文件夹，则也包含在里面。
    filenames(k-2)=[dataPath,processFile]
end
% plotPath='D:\lora\constellation\1\';
% if exist(plotPath ,'dir')
%     rmdir(plotPath ,'s') ;
% 	mkdir(plotPath);
% end

% % 遍历文件夹下的子文件夹下的所有文件
% subdir = dir(dataPath);
% length(subdir);
% filename=strings(50,1);
% k = 1;
% for i = 1:length(subdir)
%      if( isequal( subdir( i ).name, '.' )||...
%         isequal( subdir( i ).name, '..')||...
%         ~subdir( i ).isdir)               % 如果不是目录则跳过
%         continue;
%      end
%     subdirpath = fullfile( dataPath, subdir( i ).name );
%     dataFile = dir( subdirpath );               % 子文件夹下找后缀为dat的文件
%     fileNum=size(dataFile,1)-2;  % 减去2,是因为list包含了. 和 .. 路径
%    % filename=strings(fileNum,1);
% %     i=1;
%     for j = 3 : fileNum+2
%         processFile = dataFile(j).name;  % 这就是文件名，如果有子文件夹，则也包含在里面。
% %         if processFile[3] == 1
% %             i = i+1
%             filename(k,1)=[dataPath,subdir( i ).name,'\',processFile];
%             testFile = filename(k,1)
%             k = k+1;
%             lorafinger(testFile,processFile,plotPath);
% %         end 
%     end
% end


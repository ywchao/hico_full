
%create a list_file for HICO 
ANNO_FILE = './external/hico_20150920/anno.mat';

load(ANNO_FILE);

set = 'train'
RESULT_FILE = strcat('./data/hico_file_list_', set, '.txt');
fileID = fopen(RESULT_FILE,'w');
file_len_train = size(list_train,1);
for i=1:file_len_train
    fprintf(fileID, '%s ', char(list_train(i)));
    if mod(i, 100) == 1
        fprintf('processing %d/%d\n', i, file_len_train);
    end
    for j = 1:600
        fprintf(fileID,'%d ',anno_train(j,i)>0);
    end
    fprintf(fileID,'\n');
end
fclose(fileID);

set = 'test';
RESULT_FILE = strcat('./data/hico_file_list_', set, '.txt');
fileID = fopen(RESULT_FILE,'w');
file_len_test = size(list_test,1);
for i=1:file_len_test
    if mod(i, 100) == 1
        fprintf('processing %d/%d\n', i, file_len_test);
    end
    fprintf(fileID, '%s ', char(list_test(i)));
    for j = 1:600
        fprintf(fileID,'%d ',anno_test(j,i)>0);
    end
    fprintf(fileID,'\n');   
end
fclose(fileID);

fprintf('done\n');

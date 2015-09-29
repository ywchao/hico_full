
%create a list_file for HICO 
RESULT_FILE = strcat('hico_file_list_', set, '.txt');
ANNO_FILE = '/scratch/jiadeng_fluxg/shared/hico_20150920/anno.mat';

load(ANNO_FILE);

fileID = fopen(RESULT_FILE,'w');

set = 'test';
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

set = 'train'
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

fprintf('done\n');
fclose(fileID);

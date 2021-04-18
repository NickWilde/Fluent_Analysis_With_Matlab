clc
clear all
format long

FileNumbers = input('Input number of files need to be analized together\n')
index=1;
for index = 1:1:FileNumbers
    analysis_universal;
    for i=1:length(list);
        assignin('base',"A"+index+list{i},A.data(:,i));
    end
end
    
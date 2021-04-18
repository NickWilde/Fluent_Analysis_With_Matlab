%clc;
%clear all;
format long
%%
%Specify data name
target= input('Input .out file name\n','s')
filename = strcat(target,'.out');
listname = strcat(target,'.txt');
%%
%Read Variable list%
list = fileread(listname);
list = erase(list,'"');
list = strrep(list,'-','_');
list = strsplit(list)';
%%
%Read Data file%
delimiterIn = ' ';
headerlinesIn = 3;
A=importdata(filename, delimiterIn, headerlinesIn);
%%
%Assign data to their own parameter%
for i = 1: length(list)
    assignin('base',list{i},A.data(:,i))
end
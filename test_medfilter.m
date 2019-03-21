clc; %清除命令窗口的内容
clf; %清除图形
clear; %清除原有变量
colormap(gray); %设置色图，色图是一个m*3的矩阵，每一个位置的取值是0或1

img = imread('einstein.jpg');
input = imnoise(img, 'salt & pepper');  % 添加椒盐噪声，默认噪声密度0.05（噪声密度是指包含噪声值的图像区域的百分比）
output = medfilter(input, 1);  % 半径为1，即取3*3的图像块
output = uint8(output);

%figure %创建新的图形窗口
%colormap(gray) %设置色图，色图是一个m*3的矩阵，每一个位置的取值是0或1
clf %清除图形
subplot(2,3,1),imagesc(img),xlabel('img'); % 原图
subplot(2,3,2),imagesc(input),xlabel('input'); % 加了噪声的图像
subplot(2,3,3),imagesc(input-img),xlabel('real noise'); % 计算并显示所加的噪声
subplot(2,3,4),imagesc(output),xlabel('output'); % 处理后的图像
subplot(2,3,5),imagesc(input-output),xlabel('residuals noise'); % 计算并显示噪声冗余图像，对去噪结果进行定性比较

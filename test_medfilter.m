clc; %�������ڵ�����
clf; %���ͼ��
clear; %���ԭ�б���
colormap(gray); %����ɫͼ��ɫͼ��һ��m*3�ľ���ÿһ��λ�õ�ȡֵ��0��1

img = imread('einstein.jpg');
input = imnoise(img, 'salt & pepper');  % ��ӽ���������Ĭ�������ܶ�0.05�������ܶ���ָ��������ֵ��ͼ������İٷֱȣ�
output = medfilter(input, 1);  % �뾶Ϊ1����ȡ3*3��ͼ���
output = uint8(output);

%figure %�����µ�ͼ�δ���
%colormap(gray) %����ɫͼ��ɫͼ��һ��m*3�ľ���ÿһ��λ�õ�ȡֵ��0��1
clf %���ͼ��
subplot(2,3,1),imagesc(img),xlabel('img'); % ԭͼ
subplot(2,3,2),imagesc(input),xlabel('input'); % ����������ͼ��
subplot(2,3,3),imagesc(input-img),xlabel('real noise'); % ���㲢��ʾ���ӵ�����
subplot(2,3,4),imagesc(output),xlabel('output'); % ������ͼ��
subplot(2,3,5),imagesc(input-output),xlabel('residuals noise'); % ���㲢��ʾ��������ͼ�񣬶�ȥ�������ж��ԱȽ�

function [output] = meansfilter(input, radius)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input: 噪声图像
% r: 图像块半径
%
% Auther: Gao Zheng jie
% Email: 3170601003@cuit.edu.cn
% Date: 2017-12-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m n] = size(input);  % 获取图像的行列维度，并分别赋给m和n
Output = zeros(m, n);  % 定义m*n的零矩阵，用来存放去噪结果图像
input_pad = padarray(input, [radius radius], 'symmetric');  %边界延拓，使得位于图像边缘的像素点也能形成图像块。
                                                  % symmetric 对边界区域进行对称性重复（也叫镜像镶边），拓展的大小为[r r],f为图像块半径
                                                  %例如[2 3]表示垂直方向拓展2行，水平方向拓展3列
% 逐行、依次对图像中的每个像素点进行局部均值去噪处理
for i=1:m  % 行
    for j=1:n  % 列
        % 在延拓后的图像中确定将要修补点的坐标
        x = i + radius;
        y = j + radius;
        % 确定当前像素点的邻域（或者说当前点所在的图像块）
        neighbordhood = input_pad(x-radius:x+radius, y-radius:y+radius);
        output(i,j) = median(neighbordhood(:));  % 先将整个图像块扁平化，然后取中值
    end
end
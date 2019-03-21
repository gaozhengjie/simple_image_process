function [output] = meansfilter(input, radius)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input: ����ͼ��
% r: ͼ���뾶
%
% Auther: Gao Zheng jie
% Email: 3170601003@cuit.edu.cn
% Date: 2017-12-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m n] = size(input);  % ��ȡͼ�������ά�ȣ����ֱ𸳸�m��n
Output = zeros(m, n);  % ����m*n��������������ȥ����ͼ��
input_pad = padarray(input, [radius radius], 'symmetric');  %�߽����أ�ʹ��λ��ͼ���Ե�����ص�Ҳ���γ�ͼ��顣
                                                  % symmetric �Ա߽�������жԳ����ظ���Ҳ�о�����ߣ�����չ�Ĵ�СΪ[r r],fΪͼ���뾶
                                                  %����[2 3]��ʾ��ֱ������չ2�У�ˮƽ������չ3��
% ���С����ζ�ͼ���е�ÿ�����ص���оֲ���ֵȥ�봦��
for i=1:m  % ��
    for j=1:n  % ��
        % �����غ��ͼ����ȷ����Ҫ�޲��������
        x = i + radius;
        y = j + radius;
        % ȷ����ǰ���ص�����򣨻���˵��ǰ�����ڵ�ͼ��飩
        neighbordhood = input_pad(x-radius:x+radius, y-radius:y+radius);
        output(i,j) = median(neighbordhood(:));  % �Ƚ�����ͼ����ƽ����Ȼ��ȡ��ֵ
    end
end
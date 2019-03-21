function r= my_conv(a,b)
m=length(a);
n=length(b);
r=zeros(1,m+n-1);
for k = 1:m
    c = a(k)*b;
    d = r(1,k:k+n-1);
    d = d+c;
    r(1,k:k+n-1) = d;
end

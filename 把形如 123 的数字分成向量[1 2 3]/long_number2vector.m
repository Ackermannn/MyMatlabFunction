%把形如 ‘12345687’的数字分成向量

a=11011;
for i=1:length(num2str(a))
    b(i)=mod(a,10);   a=floor(a/10);
end
b=b(end:-1:1)
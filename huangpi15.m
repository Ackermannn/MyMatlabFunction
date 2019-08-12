%蒙特卡洛 随机取样法
%每次运行结果不一样且不精确
clc,clear
p0=0;
tic
for i=1:10^6
    x=randi([0,99],5,1);
   % x(1)=randi([45,55]); x(2)=randi([95,99]);x(3)=randi([0,5]);x(4)=randi([85,99]);x(5)=randi([15,25]);

    [f,g]=mengte(x);
    if all(g<=0)
        if p0<f
            x0=x;p0=f;
        end
    end
end
x0,p0
toc
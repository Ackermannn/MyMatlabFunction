%http://www.ilovematlab.cn/thread-21583-1-1.html
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% 简单的元胞自动机 %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% 初始化
m = 50;
X = zeros(m,m);
X(25,25) = 1;

n = [m 1:m-1];
e = [2:m 1];
s = [2:m 1];
w = [m 1:m-1];

% 绘制初始图形
[i,j] = find(X);
figure(gcf);
plothandle = plot(i,j,'.', ...
'Color','blue', ...
'MarkerSize',12);
axis([0 m+1 0 m+1]);
%% 演化
for k = 1:50
%邻居数
N = X(n,:) + X(s,:) + X(:,e) + X(:,w) + ...
X(n,e) + X(n,w) + X(s,e) + X(s,w);
%概率阵 
RAND = rand(m);
%换代
X = X | (N.*RAND>0.99);
%绘图
[i,j] = find(X);
set(plothandle,'xdata',i,'ydata',j)
drawnow
pause(0.2)
k 
end

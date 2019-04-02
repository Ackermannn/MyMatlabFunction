%% main
%% 自己编写的井字棋游戏
clc,clear

disp('井子棋v1.0')
disp('玩家标记为 1 ,机器标记为 9')
ninegrid = zeros(3,3); %棋盘清零
winnerflag = 0;
 
while (winnerflag == 0)
    
    scan = input('请输入您下的位置');
    [row, list] = number2matrix( scan );
    
    if ninegrid(row, list) ~= 0
        disp('输入符合不规则！')
        continue
    end
    
    ninegrid(row, list) = 1;
    disp(ninegrid)
    
    if judgehuman(ninegrid) == 1
        disp('你胜利！');
        disp('点击运行重新开始');
        break
    end
    
    %% 平局判断
    if isempty( find(ninegrid == 0, 1) )
        disp('平局')
        disp('点击运行重新开始');
        break
    end
    
    ninegrid = robot(ninegrid);
    disp(ninegrid)
    
    if judgerobot(ninegrid) == 1
        disp('你失败！');
        disp('点击运行重新开始');
        break
    end
    
end
%% 
function outgrid = robot(ninegrid)

n = 9;

rand_flag = 1;
block_flag = 1 ;
gamecase = [ 1 2 3; 4 5 6; 7 8 9; 1 4 7 ;2 5 8; 3 6 9; 1 5 9; 7 5 3];
%% 自己二连 
for i=1:8
    robotcase = gamecase(i,:);
    if sum(  ninegrid(robotcase) ) == 18
       rand_flag = 0 ;
       block_flag = 0 ;
       robotpoint = find( ninegrid(robotcase) == 0) ;
       
       ninegrid( robotcase(robotpoint) ) = n;
       outgrid = ninegrid;
       break
    end
end
%% 玩家二连
if block_flag == 1
    for i=1:8
        smallcase = gamecase(i,:);
        if sum(  ninegrid(smallcase) ) == 2
            rand_flag = 0 ;
            robotpoint = find( ninegrid(smallcase) == 0) ;
            ninegrid( smallcase(robotpoint) ) = n;
            outgrid = ninegrid;
            break
        end
    end
end
%% 其余情况随机
if rand_flag == 1
    zero_th = find(ninegrid==0);
    thsize = length(zero_th);
    ninegrid( zero_th(randi(thsize)) ) = n;
    outgrid = ninegrid;
end

end
function [output1, output2] = number2matrix(scan) 
% 
if scan <= 3
    output1 = 3;
    output2 = scan;
end
if scan > 3 && scan <= 6
    output1 = 2;
    output2 = scan-3;
end
if scan > 6 
    output1 = 1;
    output2 = scan-6;
end
end
function winnerflag = judgehuman(ninegrid)
 if isall(ninegrid(1,:),1)==1||isall(ninegrid(2,:),1)==1|| isall(ninegrid(3,:),1)==1
      winnerflag = 1;
 elseif isall(ninegrid(:,1),1)==1 || isall(ninegrid(:,2),1)==1 || isall(ninegrid(:,3),1)==1
      winnerflag = 1;
 elseif isall(ninegrid([1 5 9]),1)==1 || isall(ninegrid([3 5 7]),1)==1
      winnerflag = 1;
 else
      winnerflag = 0;
 end
end
function winnerflag = judgerobot(ninegrid)
%% 
n = 9;
%%
 if isall(ninegrid(1,:),n)==1 || isall(ninegrid(2,:),n)==1 || isall(ninegrid(3,:),n) == 1
      winnerflag = 1;
 elseif isall(ninegrid(:,1),n)==1 || isall(ninegrid(:,2),n)==1 || isall(ninegrid(:,3),n) == 1
      winnerflag = 1;
 elseif isall(ninegrid([1 5 9]),n) == 1 || isall(ninegrid([3 5 7]),n) == 1
      winnerflag = 1;
 else
      winnerflag = 0;
 end
end
function Y = isall(vector,number)
if vector == number
    Y = 1;
else
    Y = 0;
end
end

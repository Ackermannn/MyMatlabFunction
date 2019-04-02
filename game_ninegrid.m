%% main
clc,clear

disp('������v1.0')
disp('��ұ��Ϊ 1 ,�������Ϊ 9')
ninegrid = zeros(3,3); %��������
winnerflag = 0;
 
while (winnerflag == 0)
    
    scan = input('���������µ�λ��');
    [row, list] = number2matrix( scan );
    
    if ninegrid(row, list) ~= 0
        disp('������ϲ�����')
        continue
    end
    
    ninegrid(row, list) = 1;
    disp(ninegrid)
    
    if judgehuman(ninegrid) == 1
        disp('��ʤ����');
        disp('����������¿�ʼ');
        break
    end
    
    %% ƽ���ж�
    if isempty( find(ninegrid == 0, 1) )
        disp('ƽ��')
        disp('����������¿�ʼ');
        break
    end
    
    ninegrid = robot(ninegrid);
    disp(ninegrid)
    
    if judgerobot(ninegrid) == 1
        disp('��ʧ�ܣ�');
        disp('����������¿�ʼ');
        break
    end
    
end
%% 
function outgrid = robot(ninegrid)

n = 9;

rand_flag = 1;
block_flag = 1 ;
gamecase = [ 1 2 3; 4 5 6; 7 8 9; 1 4 7 ;2 5 8; 3 6 9; 1 5 9; 7 5 3];
%% �Լ����� 
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
%% ��Ҷ���
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
%% ����������
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
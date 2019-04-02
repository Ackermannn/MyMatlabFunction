function  [start,end0] = num_pi_3(n1,n2)

n20(1)= floor(n2/1000);
n20(2)= mod(floor(n2/100),10);
n20(3)= mod(floor(n2/10),10);
n20(4)= mod(floor(n2),10);
 
c=char(vpa(sym(pi),30e4));

for j = 3+n1-1:30e4
    if c(j) == num2str(n20(1)) && c(j+1) == num2str(n20(2)) && c(j+2) == num2str(n20(3))&& c(j+3) == num2str(n20(4))
        start = j-2;
        end0 = j+1;
        break
    end
end

end
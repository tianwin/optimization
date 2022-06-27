
 

a0 = 1;
x0 = [1.2;1.2];

c=0.5;
rho = 0.5;
maxiter = 1e6;


stepLengthX0Steepest = backtrackingLS(a0,x0,c,rho,maxiter,"steepest");
stepLengthX0Newton = backtrackingLS(a0,x0,c,rho,maxiter,"Newton");
x1 = [-1.2;1];
stepLengthX1Steepest = backtrackingLS(a0,x1,c,rho,maxiter,"steepest");
stepLengthX1Newton = backtrackingLS(a0,x1,c,rho,maxiter,"Newton");

function [result] = backtrackingLS(a0,x0,c,rho,maxiter,method)
a = a0;
result = [1];
x=x0;
x_last = inf;
iterationcount = 0;
    while true
        if norm(f1(x)) < 1e-6
            break
        end
        
        if norm(x-x_last) < 1e-4
            break
        end

        if iterationcount > maxiter
            break
        end
        if method == "steepest"
            p = -f1(x);
            
        else
            p = -f2(x)^(-2)*f1(x);
        end
        p = p/norm(p);
        while true
            if fun(x+a*p) <= fun(x) + c*a*transpose(f1(x))*p
                break
            end
            a=a*rho;
        end
        result(iterationcount+1) = a;
        x_last = x;
        x=x+a*p;

    iterationcount = iterationcount +1;
    end

x
norm(x-1)
iterationcount
end









% for problem 3.1 I uses 0.5 for c1 and rho.    To stop the iteration for step size, I uses the
% Wolfe condititons. To stop the iteration for x, I uses the max iteration
% times, when gradient close to zero, and when x fall with in our
% tolerance. the error for x in 
% case 1: 
%     0.1259
% 
% 
% iterationcount =
% 
%         1200
% case 2: 
%     6.3347e-05
% 
% 
% iterationcount =
% 
%         2207
% case 3:
%  0.0957
% 
% 
% iterationcount =
% 
%         2363
% case 4:
%  6.0738e-05
% 
% 
% iterationcount =
% 
%         2202

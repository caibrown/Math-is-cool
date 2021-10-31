% lorenz.m
% Code adapted from Wikipedia
% https://en.wikipedia.org/wiki/Lorenz_system
%
% ==================================================

% Parameters
sigma   = 10; 
beta    = 8/3;
rho     = 28;

% Lorenz system, 
% where a(1),a(2),a(3) correspond to x,y,z
f = @(t,a) [-sigma*a(1) + sigma*a(2);
            rho*a(1) - a(2) - a(1)*a(3); 
            -beta*a(3) + a(1)*a(2)];

% Runge-Kutta 4th/5th order ODE solver
[t,a] = ode45(f,[0 100],[1 1 1]);
% ^(eqns,[timespan],[starting coordinate])


% ==================================================
% Figures with one trajectory
% ==================================================

% Figure 1
figure;
plot(a(:,1),a(:,3),'Color',[0.4940 0.1840 0.5560])
title('\fontsize{20}Lorenz Butterfly')
xlabel('\fontsize{18}x')
ylabel('\fontsize{18}z')

% Figure 2
figure;subplot(1,2,1);
plot(a(:,1),a(:,2),'Color',[0.4940 0.1840 0.5560])
xlabel('\fontsize{18}x'); ylabel('\fontsize{18}y')

subplot(1,2,2);
plot(a(:,2),a(:,3),'Color',[0.4940 0.1840 0.5560])
xlabel('\fontsize{18}y'); ylabel('\fontsize{18}z')

% ==================================================
% Figures with two trajectories
% ==================================================

rho1    = 12;
rho2    = 15;

f1 = @(t,b) [-sigma*b(1) + sigma*b(2);
            rho1*b(1) - b(2) - b(1)*b(3); 
            -beta*b(3) + b(1)*b(2)];

f2 = @(t,c) [-sigma*c(1) + sigma*c(2);
            rho2*c(1) - c(2) - c(1)*c(3); 
            -beta*c(3) + c(1)*c(2)];
        
[t,b] = ode45(f1,[0 30],[1 1 1]);
[t,c] = ode45(f2,[0 30],[1 1 1]);

% Figure 3
figure;
subplot(1,2,1); 
plot3(b(:,1),b(:,2),b(:,3),'Color',[0.3010 0.7450 0.9330],'Linewidth',1); 
hold on;
plot3(c(:,1),c(:,2),c(:,3),'Color',[0.6350 0.0780 0.1840],'Linewidth',1);
title('\fontsize{20}Homoclinic Orbit in 3D')
xlabel('\fontsize{18}x')
ylabel('\fontsize{18}y')
zlabel('\fontsize{18}z')

subplot(1,2,2); 
plot(linspace(0,30,length(b(:,2))),b(:,2),'Color',[0.3010 0.7450 0.9330],'Linewidth',1); 
hold on
plot(t,c(:,2),'Color',[0.6350 0.0780 0.1840],'Linewidth',1);
title('\fontsize{20}Time v. y-value of Solutions')
xlabel('\fontsize{18}Time')
ylabel('\fontsize{18}y')
legend('\fontsize{18}\rho < 13.926','\fontsize{18}\rho > 13.926')

% ==================================================
% Periodic trajectories
% ==================================================

rho4     = 148;

f4 = @(t,d) [-sigma*d(1) + sigma*d(2);
            rho4*d(1) - d(2) - d(1)*d(3); 
            -beta*d(3) + d(1)*d(2)];
        
[t,d] = ode45(f4,[0 30],[1 1 1]);

% Figure 4
figure; 
subplot(1,2,1); 
plot3(d(:,1),d(:,2),d(:,3),'Color',[1 0.5 0],'Linewidth',1); 
title('\fontsize{20}Periodic Orbit')
xlabel('\fontsize{18}x')
ylabel('\fontsize{18}y')
zlabel('\fontsize{18}z')

subplot(1,2,2); 
plot(t,d(:,2),'Color',[0 0.6 0.3],'Linewidth',1);
title('\fontsize{20}Time v. z-value of Solutions')
xlabel('\fontsize{18}Time')
ylabel('\fontsize{18}z')
legend('\fontsize{18}\rho = 148')

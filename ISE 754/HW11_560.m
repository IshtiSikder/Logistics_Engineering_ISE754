gamma = [1/5 ; 1/3 ; 1/4];

%%

Q = [-1/5 1/10 1/10 1;
    1/4 -1/3 1/12 1;
    1/4 0 -1/4 1];

Q = Q.';

B = [0 ; 0 ; 0 ; 1];
disp('1a:')
disp('alpha values using alpha*Q = 0:')
alpha_1 = linsolve(Q,B)

%%

p = [-1 3/4 1;
    1/2 -1 0;
    1/2 1/4 -1;
    1 1 1];


b = [0 ; 0 ; 0; 1];

pi = linsolve(p,b);

%%

total = 0;
alpha_2 = [];

for i=1:3
    
    total = total + (pi(i)/gamma(i));
end


for i=1:3

    alpha_2(end+1) = (pi(i)/gamma(i))/ total;

end

disp('alpha values using P matrix:')
alpha_2
disp('Observation: Alpha values match in both cases!')

%%

new_Q = [-1/5 1/10 1/10;
    1/4 -1/3 1/12;
    1/4 0 -1/4];
disp('1b:')
disp('e^Qt for t=5:')
expm(5*new_Q)


disp('e^Qt for t=50:')
expm(50*new_Q)

disp('Observation: Convergence acheived with higher value of t.')

%%

P_AA = [];
P_AB = [];
P_AC = [];

for t=0:30
    P = expm(t*new_Q);
    P_AA(end+1)=P(1,1);
    P_AB(end+1)=P(1,2);
    P_AC(end+1)=P(1,3);
end

plot(P_AA)
hold on
plot(P_AB)
plot(P_AC)
hold off

legend('P_AA(t)','P_AB(t)','P_AC(t)')
title('1c) Convergence of P_AA(t), P_AB(t), P_AC(t) ')

disp('1c:')
disp('Observation: Convergence values are similar to 1a.')

x = [100 200];

P = [36 -79 ; 34 -84 ; 38 -86 ; 35 -82 ; 38 -77 ; 32 -81];

weights = [2 42 24 1 24 11]';


%%

sum((sum(abs(x - P),2)).*weights)


%%

funk = @(x) sum((sum(abs(x - P),2)).*weights)

%%

funk([10 -20])

%%

[x,tots]=fminsearch(funk,mean(P))

%%

P = [85 40; 75 40; 75 85; 45 35; 40 55; 35 55; 30 85; 55 90];
w = [11 46 36 20 32 23 20 18];
d1h = @(x,P) sum(abs(x - P), 2);
TDh = @(x) sum(w(:).*d1h(x,P));
xy = fminsearch(TDh,mean(P,1))

%%

TDh(xy)

%%

%raw materials = [A:Durham, B:Statesville, C:Wilmington, D:Asheville]

raw = [2 0.55 1.2 0.35]

supply_cost_raw = [0.08, 0.05, 0.15, 0.03]

raw_source = [270 150 420 50]

%demand = [Asheville, Winston-Salem, Greensboro, Raleigh]

demand = [10, 38, 20, 46]

supply_cost_demand = 0.8 

demand_source = [50 190 220 295]

%%

P = [raw_source  demand_source]

%%

total_demand = sum(demand)

%%

total_raw = raw*total_demand

%%

w_raw = total_raw.*supply_cost_raw

%%

w_demand = demand.*supply_cost_demand

%%

w = [w_raw w_demand]

%%

x = 10

dist = @(x,P) sqrt((x-P).^2)

%%

total_cost = @(x) sum(dist(x,P).*w)

%%

total_cost(10)

%%

mean(P)
%%

[opt_pos,opt_total_cost] = fminsearch(total_cost,mean(P))

%%

clear all

%%

point_1 = [2 1]

point_2 = [10 7]

%%

rng(2073)

low_x = point_1(1)

up_x = point_2(1)

low_y = point_1(2)

up_y = point_2(2)


num_x = (up_x - low_x)*rand(20,1)+ low_x

num_y = (up_y - low_y)*rand(20,1)+ low_y

%%

points = [num_x num_y]

scatter(points(:,1),points(:,2))

%%

a = [2 10 ; 2 1]

diff(a)

%%

R = [2 1 3; 10 7 8]

%rand(20,size(,2))

%%

size(R,1)

%%

rand(20,2)

%%

rng(2073)

P1 = 2 + rand(20,1)*8 
P2 = 1 + rand(20,1)*6

P = cat(2,P1,P2)

%%

tots_sq = @(x) sum(dists(x,P).^2,2)
tots = @(x) sum(dists(x,P),2)
tots_max = @(x) max(dists(x,P))

%%


op_sq = fminsearch(tots_sq,[0 0])

%%

%x = [10 20];

d2h = @(x,P) sqrt(sum((x - P).^2, 2));
TCh = @(x) sum(d2h(x,P).^2);


[x,TC] = fminsearch(TCh,[0 0]) 
[x_2,TC_2] = fminsearch(tots_sq,[0 0]) 

%sum(dists(x,P).^2,2)

%%

opt = optimset('fminsearch'); opt.MaxFunEvals = 1e8; opt.TolFun = 1e-8;
TCh = @(x) sum(d2h(x,P));
[x_3,TC_3] = fminsearch(TCh,mean(P,1),opt)

%%

[A,b] = fminsearch(tots,mean(P))

%%

w = ones(20,1)'














































%% Load demand data

[P,W] = uszip5('XY','Pop',mor({'NC','SC','GA'},uszip5('ST')))
%% Set parametres

n_iter = 1000
%% Approach 1

new_W = [W'; W'; W'; W'; W'] %adjusting weight for 5 new locations

[current_loc,current_soln] = minisumloc(P,new_W,'mi');

d = dists(current_loc,current_loc,'mi');

if sum(unique(d(d~=0))< 200) == 0
    lonlat2city(opt_loc,uscity)
    opt_soln
else
    disp('No feasible solution found')
end

%% Approach 2

rng(2023)
opt_soln = inf;
opt_loc = [10000 20000]

for iter=1:n_iter
    
    XY = randX(P,5);
    d = dists(XY,XY,'mi');
    
    if sum(unique(d(d~=0))< 200) == 0   %meaning all the distances are >= 200
        D = (dists(XY,P,'mi').*W');
        current_soln = sum(sum(D));
        
        if current_soln < opt_soln
            opt_soln = current_soln;
            opt_loc = XY;
        end 
    end
   
end

if opt_soln == inf
    disp('No feasible soln found')
else 
    lonlat2city(opt_loc,uscity)
    opt_soln
end


%% Approach 3

rng(2023)
dist_h = @(xy) sum(sum(dists(xy,P,'mi').*W'));
opt_soln = inf;
opt_loc = [10000 20000];

for iter=1:n_iter
    
    [current_loc,current_soln] = fminsearch(dist_h,randX(P,5));
    
    d = dists(current_loc,current_loc,'mi');
    
    if sum(unique(d(d~=0))< 200) == 0   %meaning current_loc is feasible
        if current_soln < opt_soln
            opt_soln = current_soln;
            opt_loc = current_loc;
        end
    end
   
end

if opt_soln == inf
    disp('No feasible soln found')
else 
    lonlat2city(opt_loc,uscity)
    opt_soln
end


%% Approach 4

rng(2023)
opt_soln = inf;
opt_loc = [10000 20000];

for iter=1:n_iter
    
    [current_loc,current_soln] = ala(randX(P,5),W,P,'mi'); 
    
    d = dists(current_loc,current_loc,'mi');
    
    if sum(unique(d(d~=0))< 200) == 0   %meaning current_loc is feasible
        if current_soln < opt_soln
            opt_soln = current_soln;
            opt_loc = current_loc;
        end
    end
   
end

if opt_soln == inf
    disp('No feasible soln found')
else 
    lonlat2city(opt_loc,uscity)
    opt_soln
end


















    
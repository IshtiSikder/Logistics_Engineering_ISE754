
cd matlog

%% 1. Graph Representations
%% Complete bipartite directed graph (or digraph)
C = [6 10; NaN 13; 9 16]; mdisp(C)
W = lev2adj(C) % ************************************************************************************************ (CHECK)
%% Bipartite graph
W(4,1) = 6; W(5,3) = 3; W(3,4) = 0;
W
IJC = adj2list(W) % ************************************************************************************************ (CHECK)
%% Multigraph
IJC = [
   1 -4 6
   1 -4 18
   1 5 10
   2 4 0
   2 5 13
   3 5 16
   3 5 3]
no_W = list2adj(IJC) % ************************************************************************************************ (CHECK)

%% Complete multipartite directed graph
C12 = C; mdisp(C12)
C23 = [4 12 10; 15 11 14]; mdisp(C23)
W = lev2adj(C12,C23); mdisp(W)

%% 2. Transportation Problem (TRANS)
%% TRANS in ALA
help ala
%% TRANS w/ Inf Sup
clear all
C = [8 6 10 9; 9 12 13 7; 14 9 16 5];
mdisp(C)
argmin(C,1)
dem = [45 20 30 30]
F = full(sparse(argmin(C,1),1:length(dem),dem))
TC = C.*F
TC = sum(sum(C.*F))
%% TRANS w/ Sup Constraints
sum(F,2)
sup = [55 50 40]
sum(sup) >= sum(dem)  % feasibility check
mdisp([C sup(:); dem 0])
%% Greedy vs. Optimal Solution
[F,TC] = gtrans(C,sup,dem) % ************************************************************************************************ (CHECK)


%%


trans(C,sup,dem)

























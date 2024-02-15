
A = [1 2 3 4 5]
B = [1 2]

y = 1:4

%%

P = [50 150 220 295 420]';
r = 1, f = 1, w = r * f
C = w * dists(P,P,1)
k = [150 200 150 150 200]

%%

N = 1:size(C,1)
y = [];
setdiff(N,y)
for i = setdiff(N,y)
    disp(C)
    disp(C([y i],:))
    disp(sum(min(C([y i],:),[],1)))
   i,TC = sum(k([y i])) + sum(min(C([y i],:),[],1))
end

%%

setdiff(N,y)

%%

%min(C([1],:),[],1)

C

%C([[] 1],:)

sum(min(C([[] 2],:),[],1))

%%

sum(min(C([y i],:),[],1))

%%

mdisp(C)

%%

test = [10 20 30 40 ; 100 200 300 400 ; 1000 2000 3000 4000]

%%

C([[1 2] 3],:)


%%

test = [10 20 30 40 50]'

%%

N = 1:size(C,1)
y = [];
setdiff(N,y)
for i = setdiff(N,y)
    TC(i) = sum(k([y i])) + sum(min(C([y i],:),[],1))
end

%%

TC(mor({665,785},TC))

%%

y = [];
TC = Inf; done = false;
while ~done
   TC1 = Inf;                      % Stops if y = all NF,
   for i1 = setdiff(1:size(C,1),y) % since i1 = []
      TC2 = sum(k([y i1])) + sum(min(C([y i1],:),[],1));
      if TC2 < TC1
         TC1 = TC2; i = i1;
      end
   end
   if TC1 < TC % not true if y = all NF, since TC1 = Inf
      TC = TC1; y = [y i];
   else
      done = true;
   end
end
y,TC

%%

C

%%

[y,TC,X] = ufladd(k,C)

%% EXAMPLE 2: UFL DROP Construction Procedure
%% Same data as Example 1
%% Find first NF to drop: 2
y = 1:size(C,1)
TC = sum(k(y)) + sum(min(C))
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
y(2) = []
%% Find next NF to drop: 4 or 5, pick 4
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
y(y == 4) = []
%% Find next NF to add: none reduce TC, so STOP
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end

%%

y = 1:size(C,1)
TC = sum(k(y)) + sum(min(C))
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
%y(2) = []


%% EXAMPLE 2: UFL DROP Construction Procedure
%% Same data as Example 1
%% Find first NF to drop: 2
y = 1:size(C,1)
TC = sum(k(y)) + sum(min(C))
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
y(2) = []
%% Find next NF to drop: 4 or 5, pick 4
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
y(y == 4) = []
%% Find next NF to add: none reduce TC, so STOP
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
%% EXAMPLE 2: UFL DROP Construction Procedure
%% Same data as Example 1
%% Find first NF to drop: 2
y = 1:size(C,1)
TC = sum(k(y)) + sum(min(C))
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
y(2) = []
%% Find next NF to drop: 4 or 5, pick 4
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
y(y == 4) = []
%% Find next NF to add: none reduce TC, so STOP
for i = y
   i,TC = sum(k(setdiff(y,i))) + sum(min(C(setdiff(y,i),:),[],1))
end
%% Solve using UFLDROP in Matlog
[y,TC,X] = ufldrop(k,C);
y,TC,mdisp(X)

%%

[loc_add,TC_add,X_add] = ufladd(k,C)
[loc_drop,TC_drop,X_drop] = ufldrop(k,C)


%%

%% EXAMPLE 3: UFL EXCHANGE Improvement Procedure
%% Exchange procedure, given k, C, and y as inputs
TC = sum(k(y)) + sum(min(C(y,:),[],1));
TC1 = Inf;
done = false;
while length(y) > 1 && ~done
   for i1 = y
      for j1 = setdiff(1:size(C,1),y)
         y1 = [setdiff(y,i1) j1]
         TC2 = sum(k(y1)) + sum(min(C(y1,:),[],1))
         if TC2 < TC1
            TC1 = TC2 
            i = i1 
            j = j1
         end
      end
   end
   if TC1 < TC
      one = TC1
      two = [setdiff(y,i) j]
   else
      done = true
   end
end

one,two

%%

%% EXAMPLE 4: UFL Hybrid Algorithm
[y1,TC1] = ufladd(k,C);
done = false;
while ~done
   [y,TC] = uflxchg(k,C,y1);
   if ~isequal(y,y1)
      [y1,TC1] = ufladd(k,C,y);
      [y2,TC2] = ufldrop(k,C,y);
      if TC2 < TC1
         TC1 = TC2; y1 = y2;
      end
      if TC1 >= TC
         done = true;
      end
   else
      done = true;
   end
end
y, TC

%%
k,C

%%

doc ufldrop

%%

ufladd(k,C)

%%

ufladd(k,C)

%%

k0 = 0;
y = [];
p = 3
y = ufladd(k0,C,y,p);
[y,TC,X] = uflxchg(k0,C,y);
y,TC,mdisp(X)
TC + sum(k(y))  % Make TC compariable to UFL
%% P-median procedure, given p and C as inputs
y = ufladd(0,C,[],p);
[y,TC] = uflxchg(0,C,y);
y1 = ufldrop(0,C,[],p);
[y1,TC1] = uflxchg(0,C,y1);
if TC1 < TC
   TC = TC1; y = y1;
end
y, TC

%%

ufladd(k,C,[1 2],3)

%%

pwd

%%
P = [50 150 220 295 420]'
r = 1, f = 1, w = r * f
C = w * dists(P,P,1)
k = [150 200 150 150 200]

%%

[y,TC,X]=ufladd(k,C,[],4)

%%

full(X)

sum(C(X))

%%

ufldrop(k,C,[1])

%%

doc ufldrop

































x = [3 1 2 9 5 4 ]

%%

cumsum(x)

%%
x(3)

%%
x([1:5])
%%
x([1 3 1 6 1])
%%
fliplr(x)
%%
sum(x)
%%
sumTill = @(i) sum(x(1:i));

sumTill(4)

%%
x([2 6]) = 0

%%

x(3) = []
%%

x(length(x)+1) = 7

%%

x(end+1) = 100

%%
reshape(x,3,2)'

%%
x = [6 2 1 4]
A = [2 7 9 7; 3 2 5 6; 8 2 1 5]

%%
A + x

%%
sum(A) + x

%%
2*x + A

%%
A.*x

%%

sum(A.*x,2)

%%
x = [1 5 2 7 9 0 1]
y = [5 1 2 8 0 0 2]

%%

for i=x.*(x>y);
    if i>0
        disp(i)
    end
end
%%

for i=x.*(x>y & x<6);
    if i>0
        disp(i)
    end
end 

%%

for i=x.*(x<2 | x>6);
    if i>0
        disp(i)
    end
end 

%%

(y ~= 0) + y

%%
 x(1,2)

%%

ind = find(x==0)

for i=1:length(x)
    if x(i) ~= 0
        y(i) / x(i)
    end
end 

%%

(y == 0) + y

%%

x = [1 5 2 7 9 0 1]
y = [5 1 2 8 0 0 2]

y(find(x==0)) = []

y ./ x(x~=0)

%%
x = [1 5 2 7 9 0 1]
y = [5 1 2 8 0 0 2]

x(find(y==0))=[]
y = y(y~=0)

y./x

%% 

x = [3 1];
P = [1 1; 6 1; 6 5];

masti_old = @(x) max(sqrt(sum((x - P).^2,2)));

%masti([3,1])

result = fminsearch(masti_old,[0,0])

masti_old(result)



%%

P = [1 1; 6 1; 6 5];

masti = @(x) sum(sqrt(sum((x - P).^2,2)).*[3 4 2]');

result = fminsearch(masti,[0,0])

masti(result)

%%

help sum

%%

help borgo

%%











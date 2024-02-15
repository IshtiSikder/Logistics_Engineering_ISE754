

[Name,ST,P,w] = uscity10k('Name','ST','XY','Pop',mor({'NC','SC'},uscity10k('ST')))

%tots = @(x) sum(dists(x,NC_loc,'km').*NC_pop',2) + sum(dists(x,SC_loc,'km').*SC_pop',2)

sth = w(w>=40000)

%%

tots = @(x) dists(x,P,'km')*w

[opLoc,opDis] = fminsearch(tots,mean(P))

%%

%doc lonlat2city

lonlat2city(opLoc,uscity)

%%

data = table(Name,dists(opLoc,P,'km')')

%%

val

%%

Name(20)

%%

d = dists(opLoc,P,'mi')

%%

val = table2array(argmax(data(:,2)))

%%

data(val,:)

%%

idx = argsort(d)

%%
idx = argsort(d);
closest_cities = Name(idx(1:4))

%%



idx = argmax(w)

d(idx)

%%

idx = argmin(d(w>=40000))
%Name(idx)

%%

forty = table(Name(w>=40000),d(w>=40000)')

%%

wtf = table2array(forty(table2array(argmin(forty(:,2))),1))

%%

%P(:,2)

sum(w(opLoc(2) > P(:,2)))/sum(w)*100

%length(south_cities) / length(Name)*100

%%

sum(w(d<=80))

%%

idx = mor({'raleigh','charlotte','charleston'},Name)

%%

three = P(idx,:)

%%

distances = dists(three,three,'km')
%%

for i=1:size(distances)
    r = distances(i,:)
    val = min(r(r>0))
    find(distances==val)
end 

%%

w(strcmpi('raleigh',Name))

%%

%[Name,P]

%strcmpi('detroit',uscity('Name'))

%%
%naam = uscity('Name')

val = find(strcmpi('detroit',name) & strcmpi('MI',st))

%%

[name, pos, st] = uscity('Name','XY','ST')
idx_detroit = find(strcmpi('detroit',name) & strcmpi('MI',st))
idx_gain = find(strcmpi('Gainesville',name) & strcmpi('FL',st))
idx_memphis = find(strcmpi('memphis',name) & strcmpi('TN',st))

%%

pos_detroit = pos(idx_detroit,:)
pos_gain = pos(idx_gain,:)
pos_memphis = pos(idx_memphis,:)

%%

all_pos = [pos_detroit; pos_gain ; pos_memphis]


%%

dis = [0 dists(all_pos(1,:),all_pos(2,:),'km') dists(all_pos(1,:),all_pos(3,:),'km');
    dists(all_pos(2,:),all_pos(1,:),'km') 0 dists(all_pos(2,:),all_pos(3,:),'km') ;
    dists(all_pos(3,:),all_pos(1,:),'km') dists(all_pos(3,:),all_pos(2,:),'km') 0]

%%

x = [10 20]
w = [28 48 32]

w_dis = @(x) sum(dists(x,all_pos,'km').*w,2)

%%

[opLoc,opDis] = fminsearch(w_dis,mean(all_pos))

%%

lonlat2city(opLoc,uscity)

%%

city2lonlat = @(city,st) uscity('XY',mand(city,uscity('Name'),st,uscity('ST')));
P = city2lonlat({'Detroit','Gainesville','Memphis'},{'MI','FL','TN'})

%%

minisumloc(all_pos,w,'mi')

%%

doc mand


%%

uscity('Name',mand('detroit',uscity('Name'),'MI',uscity('ST')))

%%

%doc uscity

wtv=uscity('XY')

%%

find(wtv(:,2) >= 44 & wtv(:,1)<= -60)

%%

fifty = uscity(uscity('Pop') >= 50000);

%%

dists(all_pos,all_pos,'mi')

%%

doc minisumloc





















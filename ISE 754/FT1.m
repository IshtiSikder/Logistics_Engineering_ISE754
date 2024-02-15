
cd matlog 

%% Truck Shipment Example: One-Time delivery

%% What is the maximum payload that can be shipped for a one-time delivery?




sh.d = 532; % Distance

uwt = 40; % unit weight of each product

ucu = 9; % cubic volume of each product

sh.s = uwt/ucu % product density = weight / volume

tr.Kwt = 25 % truck's weight cap in tons
tr.Kcu = 2750 % truck's volume cap

qmax = min(tr.Kwt,sh.s*tr.Kcu/2000) % min betn truck's given and effective capacity. 
%                                     2000 is converting lb to tons 
%                                     for effective capacity calculation.

qmax = maxpayld(sh,tr) %the matlog way. sh contains 
%                                       sh.s (product density) 
%                                       tr contains 
%                                       tr.Kwt (truck's weight cap in tons) and tr.Kcu (truck's volm cap)





%% Based on product demand and truck capacity, how many shipments would be required (if you
%% have just one truck) ? If you have more, than how many can be deployed at a time ?




ud = 350 % total demand for product

q = ud*(uwt/2000) % total weight for the product to be carried (in tons). uwt mentioned above.

ceil(q/qmax) %number of shipments rounded up by ceil function. qmax calculated in Q1.
             %better use ceil here in stead of round. Round can round
             %down. Ceil always rounds UP, which is relevant here.




%% What would be the 'estimated 'transportation cost for this shipment 
%% (before asking logistics service company for price)?




ppiTL = 131.4; % Jan 2018 (P) 
               % PPI stands for Producer Price Index, published monthly in
               % USA. It gives an idea regarding what's the price for
               % ANYTHING basically. 

               % current_rate ($/mi) = (current_PPI/prev_PPI)*prev_rate gives an
               % idea regarding what the current rate asked by the logistics service
               % can be, based on prev rate asked - which we know.

tr.r = 2 * (ppiTL/102.7) % calculating current rate ($/mi)
%                          prev_rate = 2 (known) ; prev_PPI = 102.7. current_PPI = ppiTL

cTL = ceil(q/qmax) * tr.r * sh.d % cost = no of shipments * current_rate * distance

cTL = transcharge(q,sh,tr) %the matlog way 





%% Truck load (TL) vs Less then Truck Load (LTL) shipments : Calculating cost rate and total cost for LTL

% LTL for any product is a likely scenario, and logistics industry has a 
% seperate cost rate for LTL.




qTL = qmax*floor(q/qmax) % TL quantity 
%                          i.e total weight of product, q = 2.14*qmax, then TL quantity qTL = 2*qmax. 
%                          If q = 0.58*qmax, then we already have LTL and
%                          qLTL = 0. The floor() func ensures this
%                          by rounding appropiately.

%                          quick note:
%                          floor(0.189) = 0 (<= 0.189)
%                          ceil(0.189) = 1 (>=0.189)
%                          round(0.189) = 0, round(0.598) = 1

qLTL = q - qmax*floor(q/qmax) % LTL quantity

ppiLTL = 179.4; % current PPI, Dr. kay used PPI for Jan 2018 (P). To be used to 
%                 estimate current rate

rLTL = rateLTL(qLTL,sh.s,sh.d,ppiLTL) % Estimates rate for LTL based on inputs.This can actually 
                                      % go upto Inf if qLTL is too larger
                                      % than 1 ton.
                                      
cLTL = rLTL * sh.d * qLTL             % cost for LTL

cLTL = transcharge(qLTL,sh,[],ppiLTL) %the matlog way





%% Calculating total cost considering both TL and LTL rates




c_comb = transcharge(qTL,sh,tr) + cLTL %the matlog way

cTL - c_comb % diff between cost(only TL rate) and cost(both TL and LTL rate).
%              Ans negative, cause LTL rate is usually more expensive.





%% If you have some LTL amount in hand (extra after one or more full TL arranged),
%% should you go with an LTL arrangement or another full TL?



cTLh = @(q) ceil(q/qmax) * tr.r * sh.d  % cost (TL rate). ceil accounts for rounding UP the 
%                                         the LTL amount (q = qLTL) to consider a full
%                                         truckload.

rLTLh = @(q) rateLTL(q,sh.s,sh.d,ppiLTL) % LTL rate for q = qLTL

cLTLh = @(q) rLTLh(q) * sh.d * q         % total cost for q=qLTL

qI = fminsearch(@(q) abs(cTLh(q)-cLTLh(q)),qLTL) %Which q=qLTL minimizes abs difference between
%                                                 totalcost_TL and totalcost_LTL. 

%                                                 Here for starting point in fminsearch, you can
%                                                 use the LTL amount in
%                                                 hand as mentioned in headline.


% As LTL costs usually run high and is risky, the value of qI (i.e 0.7882) here signifies the amount 
% for which arranging LTL as plan B for TL makes sense as cost would be
% same.

% If your LTL amount is less than this qI, your LT cost would be lower with
% all other params const. Higher cost if LTL amount is higher than qI,
% again with same condns.

%% What is the minimum charge you would have to pay for a TL/LTL service to take up your service?

MC_TL = mincharge(sh.d,ppiTL)               %for TL
MC_LTL = mincharge(sh.d,[],ppiLTL)          %for LTL

%%

doc transcharge

clear;
clc;
% load profile %%%%%%%%%%%%%%%%%%%%%%%%%%%
hour=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24];
demand=[2668;2519;2428;2388;2428;2608;2875;3240;3524;3730;3907;4012;4072;4147;4202;4234;4265;4241;4104;3975;4005;3744;3360;2979];
price=[15.77;16.78;15.04;14.14;16.53;16.85;21.48;18.9;17.52;22.05;39.51;49.29;25.03;20.88;22.42;23.05;28.8;37.36;34;29.11;39.63;19.06;19.25;17.3];
% fr = flat rate
totcost=0;
totdemand=0;
for i=1:1:24
    totcost=demand(i)*price(i)+totcost;
    totdemand=totdemand+demand(i);
end
fr=totcost/totdemand;
for i=1:1:24
    price0(i)=fr;
end
%%%% an argument for the reward
for i=1:1:24
    reward0(i)=0;
end
%%% reward for peak time
for i=16:1:22
    reward0(i)=15;
end

price=price0;

%%%%price elasticity martrix:      peak      offpeak       low
%%%%                    peak        -0.1      0.016        0.012
%%%%                    offpeak     0.016     -0.1         0.01
%%%%                    low         0.012     0.01          -0.1
%%%%% for this data set, the best timing are as follows : peak time 16-22 ,
%%%%% offpeak time 10-15 and 23-24 and low time 1-9


%%%% hours 1-9 are the low rate times
for i=1:9
    demand2(i)=demand(i)+(-0.1)*[demand(i)/price0(i)]*(price(i)-price0(i)+reward0(i))...
            +(0.01)*[demand(i)/price0(10)]*(price(10)-price0(10)+reward0(10))...
            +(0.01)*[demand(i)/price0(11)]*(price(10)-price0(11)+reward0(11))...
            +(0.01)*[demand(i)/price0(12)]*(price(12)-price0(12)+reward0(12))...
            +(0.01)*[demand(i)/price0(13)]*(price(13)-price0(13)+reward0(13))...
            +(0.01)*[demand(i)/price0(14)]*(price(14)-price0(14)+reward0(14))...
            +(0.01)*[demand(i)/price0(15)]*(price(15)-price0(15)+reward0(15))...        
            +(0.012)*[demand(i)/price0(16)]*(price(16)-price0(16)+reward0(16))...
            +(0.012)*[demand(i)/price0(17)]*(price(17)-price0(17)+reward0(17))...
            +(0.012)*[demand(i)/price0(18)]*(price(18)-price0(18)+reward0(18))...
            +(0.012)*[demand(i)/price0(19)]*(price(19)-price0(19)+reward0(19))...
            +(0.012)*[demand(i)/price0(20)]*(price(20)-price0(20)+reward0(20))...
            +(0.012)*[demand(i)/price0(21)]*(price(21)-price0(21)+reward0(21))...
            +(0.012)*[demand(i)/price0(22)]*(price(22)-price0(22)+reward0(22))...            
            +(0.01)*[demand(i)/price0(23)]*(price(23)-price0(23)+reward0(23))...
            +(0.01)*[demand(i)/price0(24)]*(price(24)-price0(24)+reward0(24));
end

%%%% hours 10-15 and 23-24 are the off peak times
for i=10:15
    demand2(i)=demand(i)+(-0.1)*[demand(i)/price0(i)]*(price(i)-price0(i)+reward0(i))...
        +(0.01)*[demand(i)/price0(1)]*(price(1)-price0(1)+reward0(1))...
        +(0.01)*[demand(i)/price0(2)]*(price(2)-price0(2)+reward0(2))...
        +(0.01)*[demand(i)/price0(3)]*(price(3)-price0(3)+reward0(3))...
        +(0.01)*[demand(i)/price0(4)]*(price(4)-price0(4)+reward0(4))...
        +(0.01)*[demand(i)/price0(5)]*(price(5)-price0(5)+reward0(5))...
        +(0.01)*[demand(i)/price0(6)]*(price(6)-price0(6)+reward0(6))...
        +(0.01)*[demand(i)/price0(7)]*(price(7)-price0(7)+reward0(7))...
        +(0.01)*[demand(i)/price0(8)]*(price(8)-price0(8)+reward0(8))...
        +(0.01)*[demand(i)/price0(9)]*(price(9)-price0(9)+reward0(9))...        
        +(0.016)*[demand(i)/price0(16)]*(price(16)-price0(16)+reward0(16))...
        +(0.016)*[demand(i)/price0(17)]*(price(17)-price0(17)+reward0(17))...
        +(0.016)*[demand(i)/price0(18)]*(price(18)-price0(18)+reward0(18))...
        +(0.016)*[demand(i)/price0(19)]*(price(19)-price0(19)+reward0(19))...
        +(0.016)*[demand(i)/price0(20)]*(price(20)-price0(20)+reward0(20))...
        +(0.016)*[demand(i)/price0(21)]*(price(21)-price0(21)+reward0(21))...
        +(0.016)*[demand(i)/price0(22)]*(price(22)-price0(22)+reward0(22));
end
for i=23:24
    demand2(i)=demand(i)+(-0.1)*[demand(i)/price0(i)]*(price(i)-price0(i)+reward0(i))...
        +(0.01)*[demand(i)/price0(1)]*(price(1)-price0(1)+reward0(1))...
        +(0.01)*[demand(i)/price0(2)]*(price(2)-price0(2)+reward0(2))...
        +(0.01)*[demand(i)/price0(3)]*(price(3)-price0(3)+reward0(3))...
        +(0.01)*[demand(i)/price0(4)]*(price(4)-price0(4)+reward0(4))...
        +(0.01)*[demand(i)/price0(5)]*(price(5)-price0(5)+reward0(5))...
        +(0.01)*[demand(i)/price0(6)]*(price(6)-price0(6)+reward0(6))...
        +(0.01)*[demand(i)/price0(7)]*(price(7)-price0(7)+reward0(7))...
        +(0.01)*[demand(i)/price0(8)]*(price(8)-price0(8)+reward0(8))...
        +(0.01)*[demand(i)/price0(9)]*(price(9)-price0(9)+reward0(9))...        
        +(0.016)*[demand(i)/price0(16)]*(price(16)-price0(16)+reward0(16))...
        +(0.016)*[demand(i)/price0(17)]*(price(17)-price0(17)+reward0(17))...
        +(0.016)*[demand(i)/price0(18)]*(price(18)-price0(18)+reward0(18))...
        +(0.016)*[demand(i)/price0(19)]*(price(19)-price0(19)+reward0(19))...
        +(0.016)*[demand(i)/price0(20)]*(price(20)-price0(20)+reward0(20))...
        +(0.016)*[demand(i)/price0(21)]*(price(21)-price0(21)+reward0(21))...
        +(0.016)*[demand(i)/price0(22)]*(price(22)-price0(22)+reward0(22));
end

%%%% hours 16-22 are the peak time
for i=16:22
     demand2(i)=demand(i)+(-0.1)*[demand(i)/price0(i)]*(price(i)-price0(i)+reward0(i))...
        +(0.012)*[demand(i)/price0(1)]*(price(1)-price0(1)+reward0(1))...
        +(0.012)*[demand(i)/price0(2)]*(price(2)-price0(2)+reward0(2))...
        +(0.012)*[demand(i)/price0(3)]*(price(3)-price0(3)+reward0(3))...
        +(0.012)*[demand(i)/price0(4)]*(price(4)-price0(4)+reward0(4))...
        +(0.012)*[demand(i)/price0(5)]*(price(5)-price0(5)+reward0(5))...
        +(0.012)*[demand(i)/price0(6)]*(price(6)-price0(6)+reward0(6))...
        +(0.012)*[demand(i)/price0(7)]*(price(7)-price0(7)+reward0(7))...
        +(0.012)*[demand(i)/price0(8)]*(price(8)-price0(8)+reward0(8))...
        +(0.012)*[demand(i)/price0(9)]*(price(9)-price0(9)+reward0(9))...
            +(0.016)*[demand(i)/price0(10)]*(price(10)-price0(10)+reward0(10))...
            +(0.016)*[demand(i)/price0(11)]*(price(10)-price0(11)+reward0(11))...
            +(0.016)*[demand(i)/price0(12)]*(price(12)-price0(12)+reward0(12))...
            +(0.016)*[demand(i)/price0(13)]*(price(13)-price0(13)+reward0(13))...
            +(0.016)*[demand(i)/price0(14)]*(price(14)-price0(14)+reward0(14))...
            +(0.016)*[demand(i)/price0(15)]*(price(15)-price0(15)+reward0(15))...                  
            +(0.016)*[demand(i)/price0(23)]*(price(23)-price0(23)+reward0(23))...
            +(0.016)*[demand(i)/price0(24)]*(price(24)-price0(24)+reward0(24));
   
end
peak=0;
peakhours=0;
for i=16:1:22
    peak=demand(i)+peak;
    peakhours=peakhours+1;
end
for i=1:1:24
    bline(i)=peak/peakhours;
end

hold on
plot(hour,demand)
plot(hour,demand2,'k')
plot (bline,'r')
grid on


%%%% calculation
% flat rate total cost
totcost
totdemand
peak2=0;
for i=16:1:22
    peak2=demand2(i)+peak2;
end
peak2/peak
totcost2=0;
totdemand2=0;
for i=1:1:24
    totcost2=demand2(i)*price(i)+totcost2;
    totdemand2=totdemand2+demand2(i);
end
totcost2
totdemand2

%%%% customer credit
totcredit=0
for j=16:1:22
    totcredit=totcredit+abs(demand2(j)-bline(j))*reward0(j);
end
Tot=totcost2-totcredit

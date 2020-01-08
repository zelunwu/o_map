function [h,p1,p2] = o_plotts(Time,TS,window_size,date_fit_s1,date_fit_e1,date_fit_s2,date_fit_e2)
% h = o_plotts(Time,TS,window_size,[date_fit_s,datefit_e])

Time = reshape(Time,[1,length(Time)]);
TS = reshape(TS,[1,length(Time)]);


Flag_Fit1 = find(Time>=date_fit_s1&Time<=date_fit_e1);
[p1,S] = polyfit(Time(Flag_Fit1),TS(Flag_Fit1),1);

[TS_Fit1,delta] = polyval(p1,Time(Flag_Fit1),S);

Flag_Fit2 = find(Time>=date_fit_s2&Time<=date_fit_e2);
[p2,S] = polyfit(Time(Flag_Fit2),TS(Flag_Fit2),1);

[TS_Fit2,delta] = polyval(p2,Time(Flag_Fit2),S);

h = plot(Time,TS);
c1 = get(h,'color');
hold on;
h = plot(Time,movmean(TS,window_size),'-','linewidth',2,'color',c1);
h = plot(Time(Flag_Fit1),TS_Fit1,'-','linewidth',3,'color',c1);
h = plot(Time(Flag_Fit2),TS_Fit2,'-','linewidth',3,'color',c1);

datetick('x','yyyy');
hold off;

end
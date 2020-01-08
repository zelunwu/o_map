function h = o_filled_plot(x,y,p_color,n_color)
% h = o_filled_plot(x,y,p_color,n_color)
%e.g.:
% h = o_filled_plot(x,y,'r','b');

y_p = y; 
y_p(y_p<=0) = 0;
y_n = y;
y_n(y_n>=0) = 0;
h = area(x,y_p,'facecolor',p_color);
hold on;
h = area(x,y_n,'facecolor',n_color);
hold off;
end
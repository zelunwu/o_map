function [h]= o_quiverwithlabel(rlon,rlat,u,v,region_label_lon,region_label_lat,ref_length,S)
%[h]= o_quiverwithlabel(lon,lat,u,v,range_label_lon,range_label_lat,ref_legth,S)
%label_lon should be like this: [110 120], so as label_lat
%   This Function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   Edit by ZelunWu.

warning off
% figure;
% colormap jet
set(gcf,'position',[150,150,1080,480]); %Set figure position and size

if max(rlat)>80
    lat_range = [-65 65];
else
    lat_range = [min(rlat) max(rlat)];
end

lon_range = [min(rlon) max(rlon)];

rlon = double(rlon);
rlat = double(rlat);

nan_in_x = find(rlon>region_label_lon(1) & rlon<region_label_lon(2));
nan_in_y = find(rlat>region_label_lat(1) & rlat<region_label_lat(2));


u(nan_in_x,nan_in_y) = nan;
v(nan_in_x,nan_in_y) = nan;
label_in_x = fix((min(nan_in_x)+0.3*range(nan_in_x)));;
label_in_y = fix((min(nan_in_y)+max(nan_in_y))/2);

u(label_in_x,label_in_y) = ref_length;
v(label_in_x,label_in_y) = 0;

[lat lon] = meshgrid(rlat,rlon);

m_proj('Mercator','lon',lon_range,'lat',lat_range); %Make a new project and define its range


U = sqrt(u.*u + v.*v);
hold on
m_pcolor(rlon,rlat,U');
colorbar('vert');
shading flat

m_coast('patch',[0.5 0.5 0.5]); 
m_gshhs_i('color',[0.5 0.5 0.5]);  
m_grid; 
% colorbar('vert'); 
[h] = m_quiver(lon,lat,u,v,S);
xlabel('Longitude','fontweight','bold','fontsize',13);
ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
% text(label_in_x,label_in_y-range(nan_in_x)*0.4,[num2str(ref_length),' ',unit]);
set(gca,'linewidth',1.5);
end
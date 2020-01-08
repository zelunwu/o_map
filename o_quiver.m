function [h]= o_quiver(varargin)
%[cs,h] = o_quiver(lon,lat,u,v)
%   This Function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   Edit by ZelunWu.

warning off
% figure;
% colormap jet
% set(gcf,'position',[150,150,1080,480]); %Set figure position and size
lon = varargin{1};
lat = varargin{2};


if max(lat)>80
    lat_range = [-65 65];
else
    lat_range = [min(lat) max(lat)];
end

lon_range = [min(lon) max(lon)];

lon = double(lon);
lat = double(lat);
[rlat rlon] = meshgrid(lat,lon);
u = varargin{3};
v = varargin{4};

if nargin > 4
    lon_range=varargin{5};
    lat_range=varargin{6};
else
    lon_range=[min(lon) max(lon)];
    lat_range=[min(lat) max(lat)];
end

if isempty(lon_range)
    lon_range=[min(lon) max(lon)];
%     lat_range=[min(lat) max(lat)];
end
if isempty(lat_range)
%     lon_range=[min(lon) max(lon)];
    lat_range=[min(lat) max(lat)];
end

m_proj('Mercator','lon',lon_range,'lat',lat_range); %Make a new project and define its range

% U = sqrt(u.*u + v.*v);
% 
% m_pcolor(lon,lat,U');
% shading flat
% % colorbar;
% hold on

if nargin == 4
    [h] = m_quiver(rlon,rlat,u,v);
else
    [h] = m_quiver(rlon,rlat,u,v,varargin{7:end});
end



m_coast('patch',[0.5 0.5 0.5]); 
m_gshhs_i('color',[0.5 0.5 0.5]);  
m_grid; 
% colorbar('vert'); 
% xlabel('Longitude','fontweight','bold','fontsize',13);
% ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
set(gca,'linewidth',1.5);
end
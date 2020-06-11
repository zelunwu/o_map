function [h]= o_quiver(lon,lat,u,v,varargin)
%[cs,h] = o_quiver(lon,lat,u,v)
%   This Function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   Edit by ZelunWu.

warning off
% figure;
% colormap jet
% set(gcf,'position',[150,150,1080,480]); %Set figure position and size
load cmap_bnr.mat;
colormap(cmap_bnr);

lon = double(lon);
lat = double(lat);
u = double(u);
v = double(v);
if nargin > 4 & ~isempty(varargin{1})
    lon_range = varargin{1};
else
    lon_range=[min(lon,[],'all') max(lon,[],'all')];
end
if nargin > 5 & ~isempty(varargin{2})
    lat_range = varargin{2};
else
    lat_range=[min(lat,[],'all') max(lat,[],'all')];
end

m_proj('miller','lon',lon_range,'lat',lat_range); %Make a new project and define its range
[lat, lon] = meshgrid(lat,lon);
if nargin == 4
    [h] = m_quiver(lon,lat,u,v,'k');
else
    [h] = m_quiver(lon,lat,u,v,varargin{6:end});
end


% shading interp;
% m_coast('patch',[0.80 0.80 0.80],'edgecolor','none');

% m_coast('patch',[1 1 1]);
% m_coast;
m_gshhs_i('color','k');  
m_grid('fontsize',12); 
% colorbar;
% xlabel('Longitude','fontweight','bold','fontsize',13);
% ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
% set(gca,'linewidth',1.5);
end
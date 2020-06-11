function [C,h]= o_contourf(varargin)
%[cs,h] = o_contourf(varargin)
%   This function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   The syntax rules is the same with 'm_contourf', but it will add the
%   coast and grid automatically.
%
%   Edit by ZelunWu.

warning off
load cmap_bnr.mat;
colormap(cmap_bnr);
lon = varargin{1};
lat = varargin{2};
lon = double(lon);
lat = double(lat);
v = varargin{3};
v = double(v);
if nargin>3 & ~isempty(varargin{4})
    lon_range = varargin{4};
    lat_range = varargin{5};
else
    lon_range=[min(lon,[],'all') max(lon,[],'all')];
	lat_range=[min(lat,[],'all') max(lat,[],'all')];
end

m_proj('miller','lon',lon_range,'lat',lat_range); %Make a new project and define its range

if nargin == 5
    [C,h] = m_contourf(lon,lat,v);
else
    [C,h] = m_contourf(lon,lat,v,varargin{6:end});
end

shading interp;
% m_coast('patch',[0.80 0.80 0.80],'edgecolor','none');

% m_coast('patch',[1 1 1]);
% m_coast;
m_gshhs_i('color','k');  
m_grid('fontsize',15); 
% colorbar;
% xlabel('Longitude','fontweight','bold','fontsize',13);
% ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
% set(gca,'linewidth',1.5);
end
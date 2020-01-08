function [C,h]= o_contourf(varargin)
%[cs,h] = o_contourf(varargin)
%   This function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   The syntax rules is the same with 'm_contourf', but it will add the
%   coast and grid automatically.
%
%   Edit by ZelunWu.

warning off


lon = varargin{1};
lat = varargin{2};
lon = double(lon);
lat = double(lat);
v = varargin{3};
v = double(v);

in_argin = 4;
if nargin > 3
    in_argin = 4;
    while ~isstr(varargin{in_argin})
        in_argin = in_argin + 1;
    end
end

if in_argin > 5
    lon_range = varargin{4};
    lat_range = varargin{5};
else
    lon_range=[min(lon,[],'all') max(lon,[],'all')];
    lat_range=[min(lat,[],'all') max(lat,[],'all')];
end

m_proj('miller','lon',lon_range,'lat',lat_range); %Make a new project and define its range


if nargin >= 3
    [C,h] = m_contourf(lon,lat,v,varargin{in_argin:end});
else
    [C,h] = m_contourf(lon,lat,v);
end


shading interp;
m_coast('patch',ones(1,3)*0.9,'edgecolor','none');

% m_coast('patch',[1 1 1]);
% m_coast;
m_gshhs_l('color',ones(1,3)*0.7);  
m_grid('fontsize',20); 
o_cmap('bnr');
% colorbar;
% xlabel('Longitude','fontweight','bold','fontsize',13);
% ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
% set(gca,'linewidth',1.5);
end
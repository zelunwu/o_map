function A = o_eartharea(lon,lat,lon_interval,lat_interval,R)

% A = o_eartharea(lon,lat,lon_interval,lat_interval,R)
% if R is empty, R = 6400km;
% defaut output unit is meter square

if nargin == 4
    R = 6400*1000;
elseif nargin == 2
    R = 6400*1000;
    lon_interval = lon(2) - lon(1);
    lat_interval = lat(2) - lat(1);
end

lon = lon - 0.5*lon_interval;
lon(end+1) = lon(end) + lon_interval;
lat = lat - 0.5*lat_interval;
lat(end+1) = lat(end) + lat_interval;

[lat_mesh lon_mesh] = meshgrid(lat,lon);

Sind_Latitude = sind(lat_mesh); % Intergration, size = 360*180
Coefficient = 2*pi*R^2;

Circumference_Area = Coefficient * (Sind_Latitude(:,2:end)-Sind_Latitude(:,1:end-1));
Lon_Interval = (lon_mesh(2:end,:) - lon_mesh(1:end-1,:))/360;
A = Circumference_Area(1:end-1,:) .* Lon_Interval(:,1:end-1);
end
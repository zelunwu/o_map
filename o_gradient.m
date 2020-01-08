function [dz_dx dz_dy] = o_gradient2d(lon,lat,P)

N_x = length(lon); N_y = length(lat);
if size(P,1) == N_lon;P = P';end
if ndim(lon) == 1;[lon,lat] = meshgrid(lon,lat);end

dx = nan(size(P)); dy = dx; dP_x = dx; dP_y = dx;

for in_x = 2:N_x-1
    for in_y = 2:N_y-1
        dx(in_x,in_y) = rnt_earthdist(lon(in_x,in_y-1),lat(in_x,in_y-1),lon(in_x,in_y+1),lat(in_x,in_y+1));
        dy(in_x,in_y) = rnt_earthdist(lon(in_x-1,in_y),lat(in_x-1,in_y),lon(in_x+1,in_y),latin_x+1,in_y);
    end
end
            
for in_y = 1:N_y
    dx(

end

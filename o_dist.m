function dist = o_dist(lon,lat,unit)
% dist = o_dist(lon,lat,unit)
% lon and lat: 1*N or N*1 time series
% unit: 'm' or 'km'

for i = 1:length(lon)-1
    dist(i) = rnt_earthdist(lon(i),lat(i),lon(i+1),lat(i+1));
end

switch unit
    case 'km'
        dist = dist./1000;
    case 'm'
        dist = dist;
end
    
end


function theResult = rnt_earthdist(alon, alat, blon, blat, radius)

    % rnt_earthdist -- Distance in meters between two lon/lats.
    %  earthdist(alon, aloat, blon, blat, radius) returns the
    %   distance in maters between locations (alon, alat)
    %   and loncations (blon, blat).  The default earth radius is
    %   assumed to be 6371*1000 meters, the radius for
    %   a sphere of equal-volume.
    %
    %  from Chuck..

    if nargin < 4, help(mfilename), return, end
    if nargin < 5, radius = 6371*1000; end   % meters.

    RCF = 180 / pi;

    alon = alon / RCF;
    alat = alat / RCF;
    blon = blon / RCF;
    blat = blat / RCF;

    c = cos(alat);
    ax = c .* cos(alon);
    ay = c .* sin(alon);
    az = sin(alat);

    c = cos(blat);
    bx = c .* cos(blon);
    by = c .* sin(blon);
    bz = sin(blat);

    result = acos(ax.*bx + ay.*by + az.*bz) .* radius;

    if nargout > 0
            theResult = result;
    else
            disp(result)
    end
end




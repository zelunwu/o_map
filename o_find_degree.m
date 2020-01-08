function index = o_find_degree(var,degree,err)
if nargin == 2
    err = 0.0001;
end
index = find(var<degree+err&var>degree-err);
end
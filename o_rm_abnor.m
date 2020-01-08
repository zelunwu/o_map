function v = o_rm_obnor(v,v_range)
v_min = v_range(1);
v_max = v_range(2);
v(v>v_max|v<v_min) = nan;
end
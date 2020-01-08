function map = o_cmap(varargin)

% map = o_cmap(varargin)



if nargin == 1; figH = gcf; else;figH = varargin{1}; end
cmap = varargin{end};
load(['cmap_',cmap]);
cmd_str = ['map = colormap(cmap_',cmap,');'];
eval(cmd_str);
end
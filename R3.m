function A = R3(x)

% if nargin > 1
%     error('Too many inputs.  See help file')
% end

A = [cos(x)  sin(x)     0;-sin(x) cos(x)     0;0       0         1];
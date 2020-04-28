function figw(w,fh,h)

%figw   Setter bredde på figur for bruk i Word (default = 700)
%
%   figw(w,fh,h)
%   w er bredden i pixels, hf er handel til figur (default = current figure) og
%   h er høyde (default = uendret)
%   Robert Aasheim, rev. 1.0, 18/11-2004

%       rev. 1.0, 24/5-2004, Robert Aasheim
%   første utgave
%       rev. 1.1, 18/11-04, RAa
%   lagt inn at nedre kant skal være >= 0.


if nargin == 0
    w = 700;
    fh = gcf;
    h = 0;
elseif nargin == 1
    fh = gcf;
    h = 0;
elseif nargin == 2
    h = 0;
end

scrsz = get(0,'ScreenSize');
pos = get(fh, 'Position');
if pos(2) <= 0, pos(2) = 0; end
if h > 0
    set(fh, 'Position', [min(pos(1),scrsz(3)-w-4) min(pos(2),scrsz(4)-h-80) w h]);
%     disp(num2str([min(pos(1),scrsz(3)-w-4) min(pos(2),scrsz(4)-h-80) w h]))
else
    set(fh, 'Position', [min(pos(1),scrsz(3)-w-4) min(pos(2),scrsz(4)-pos(4)-80) w pos(4)]);
%     disp(num2str([min(pos(1),scrsz(3)-w-4) min(pos(2),scrsz(4)-pos(4)-80) w pos(4)]))    
end    
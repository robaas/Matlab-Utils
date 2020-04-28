function zoomx
%zoomx   zoomer x-aksen for alle subplot 
% 
%   zoomx 
%   ingen argumenter, tar alle subplot i figuren
%   (men ikke legends og annet med akser [0 1 0 1]). 
%   Kaller connectaxes (før ver. 7.0)
%   rev. 1.1, 23/9-04, RAa

%       rev. 1.0, jan-2002, Robert Aasheim
%   første utgave
%       rev. 1.1, 23/9-04, RAa
%   tilpasset Matlab versjon 7.0

fig = figure(gcf);
zoom on;
H = findobj(fig,'type','axes');
h = [];
for i = 1:length(H)
    if sum(axis(H(i)) == [0 1 0 1]) < 4
        h = [h; i];
    end
end

v = ver;
if v(find(strcmp({v.Name},'MATLAB'))).Version >=7
    linkaxes(H(h),'x');
else
    connectaxes('+x',H(h));
end
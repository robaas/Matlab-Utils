function datama = mova(data,n)
%mova   moving average
%
%   datama = mova(data,n)
%   n bredde på vindu
%   Robert Aasheim, rev. 1.2, 29/2-2012

%       rev. 1.0, 9/9-2004  Robert Aasheim
%       rev. 1.1, 9/9-04, RAa
%   liten endring i beregningsmetode
%       rev. 1.2, 29/2-12, RAa
%   mean(x,1), 1 lagt til for multipel serier / matrise

if isinf(n), n=14; end
if n > 1
    datama = data*0;
    warning off MATLAB:divideByZero
    
    for i = 1:ceil(n/2);
        datama(i,:) = mean(data(1:i,:),1,'omitnan');
    end

    for i = ceil(n/2)+1:length(data)-ceil(n/2)
        datama(i,:) = mean(data(i-ceil(n/2):i+floor(n/2),:),1,'omitnan');
    end
    
    for i = length(data)-ceil(n/2):length(data);
        datama(i,:) = mean(data(i:end,:),1,'omitnan');
    end
    
    warning on MATLAB:divideByZero
else
    datama = data;
end


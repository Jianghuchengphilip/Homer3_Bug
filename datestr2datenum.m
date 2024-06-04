function [datetimeNum, datetimeStr] = datestr2datenum(datetimeStr)
datetimeNum = 0;

START_YEAR     = 2000;
MONTHS         = {'1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'};
NUMDAYSINMONTH = [  31    29    31    30    31    30    31    31    30    31    30    31 ];

base_yr  = 32140800;   % 12*31*24*60*60
base_mo  = 2678400;    % 31*24*60*60;
base_day = 86400;      % 24*60*60;
base_hr  = 3600;       % 60*60;
base_min = 60;
datetimeStr
date_standard_fmt = char(datetime(datetimeStr, 'TimeZone','local','Format','dd-MM月-yyyy HH:mm:ss'));
date_standard_fmt
year    = str2num(date_standard_fmt(7:10)) - START_YEAR;
month   = find(strcmpi(MONTHS, date_standard_fmt(3:5)));
day     = str2num(date_standard_fmt(1:2));
hour    = str2num(date_standard_fmt(12:13));
min     = str2num(date_standard_fmt(15:16));
sec     = str2num(date_standard_fmt(18:19));

% Now that we have a numeric date, check it for errors
if year<0
    return;
end
if isempty(month) || month<1 || month>12
    return;
end
if day<1 || day>NUMDAYSINMONTH(month)
    return;
end
if hour<0 || hour>23
    return;
end
if min<0 || min>59
    return;
end
if sec<0 || sec>59
    return;
end

datetimeNum = uint32(year*base_yr + month*base_mo + day*base_day + hour*base_hr + min*base_min + sec);


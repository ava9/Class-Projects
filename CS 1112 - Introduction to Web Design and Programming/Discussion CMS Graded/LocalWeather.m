classdef  LocalWeather < handle
    % Weather data (monthly low, high, and precip) for a city from a
    % standard city weather data file.
    
    properties
        city= '';  % City name string
        temps= Interval.empty();
        % array of 12 Intervals, each (monthly low, monthly high)
        precip  % numeric vector of length 12, each monthly precipitation
    end
    
    methods
        function lw = LocalWeather(fname)
            if nargin==1
                fid= fopen(fname, 'r');
                % Get city name
                s= fgetl(fid);
                lw.city= s(3:length(s));
                % Read pass headers lines (next 3 lines)
                for k=1:3
                    s= fgetl(fid);
                end
                % Read monthly data (next 12 lines)
                for k= 1:12
                    s= fgetl(fid);
                    lw.temps(k)= Interval(str2double(s(4:8)), ...
                        str2double(s(12:16)));
                    lw.precip(k)= str2double(s(20:24));
                end
                fclose(fid);
            end
        end
        
        function showMonthData(self, m)
            % Show data for month m.  m is an integer and 1<=m<=12.
            mo= {'Jan','Feb','Mar','Apr','May','June',...
                'July','Aug','Sep','Oct','Nov','Dec'};
            fprintf('%s Data\n', mo{m})
            fprintf('Temperature range: ')
            disp(self.temps(m))
            fprintf('Average precipitation: %.2f\n', self.precip(m))
        end
        
        function p = getAnnualPrecip(self)
            %If any month is missing precip data, display a warning message
            % and p is NaN.  Otherwise p is annual precipitation.
            p=0;
            count=0;
            maxPrecip=-inf;
            minPrecip=inf;
            for k= 1:12
                if(self.precip(k) > maxPrecip)
                    maxPrecip=self.precip(k); %find maxPrecip Val In array
                end
                if(self.precip(k) < minPrecip)
                    minPrecip=self.precip(k); %find minPrecip Val In array
                end
            end
            for k=1:12
                if(self.precip(k)<=maxPrecip)&&(self.precip(k)>=minPrecip)
                    count=count+1;
                end
            end
            if(count==12) %find Annual Precipitation
                for k=1:12
                    p=p+self.precip(k);
                end
                %fprintf('The annual precipitation is: %f', p);
            else %month(s) is(are) missing precip data and p=NaN
                p=NaN('double');
                %disp('NOTE: Some Monthly Precipitation Data is Missing');
                %fprintf('The annual precipitation is: %f', p);
            end
        end
        
        function tempVec = getMonthlyAveTemps(self)
            % tempVec is length 12 vector of monthly average temperatures.
            % tempVec(m) is average between month m's high and low temps.
            % If a month is missing either high or low temp (NaN), then
            % that month's average is also NaN.
            tempVec= zeros(1,12);
            avg=0;
            countLeft=0;
            countRight=0;
            i=0;
            j=0;
            mxTL=-inf; %Max Left Temperature
            mnTL=inf;  %Min Left Temperature
            mxTR=-inf; %Max Right Temperature
            mnTR=inf;  %Min Right Temperature
            for k= 1:12
                if(self.temps(k).left > mxTL)
                    mxTL=self.temps(k).left;
                end
                if(self.temps(k).left < mnTL)
                    mnTL=self.temps(k).left;
                end
                if(self.temps(k).right > mxTR)
                    mxTR=self.temps(k).right;
                end
                if(self.temps(k).right < mnTR)
                    mnTR=self.temps(k).right;
                end
            end
            for k=1:12
                if(self.temps(k).left<=mxTL)&&(self.temps(k).left>=mnTL)
                    countLeft=countLeft+1;
                else
                    missingIndexLeft(i+1)=k;
                    i=i+1;
                end
            end
            for k=1:12
                if(self.temps(k).right<=mxTR)&&(self.temps(k).right>=mnTR)
                    countRight=countRight+1;
                else
                    missingIndexRight(j+1)=k;
                    j=j+1;
                end
            end
            if(countLeft==12)&&(countRight==12)
                for k=1:12
                    tempVec(k)=(self.temps(k).left+self.temps(k).right)/2;
                end
                %fprintf('The avg Monthly Temperatures are: %f', tempVec);
            else %month(s) is(are) missing temp data
                for k=1:i
                    if(i~=0)
                        tempVec(missingIndexLeft(k))=NaN('double');
                    end
                end
                for k=1:j
                    if(j~=0)
                        tempVec(missingIndexRight(k))=NaN('double');
                    end
                end
                for k=1:12
                    if(tempVec(k)==0)
                        avg=(self.temps(k).left+self.temps(k).right)/2;
                        tempVec(k)=avg;
                    end
                end
                %fprintf('The avg Monthly Temperatures are: %f', tempVec);
            end
        end
        
        function showCityName(self)
            disp(self.city)
        end
        
    end %methods
    
end %classdef
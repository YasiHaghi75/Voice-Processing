function f0 = yindetectf0(x,fs,ws,minf0,maxf0)
% Fundamental frequency detection function with yin algorithm
% x: input signal
% fs: sampling rate
% ws: integration window length
% minf0: minimum f0; f0 should not be below this frquency.
% maxf0: maximum f0; f0 should not be above this frquency.
% f0: fundamental frequency detected in Hz

maxlag = ws-2; % maximum lag 
th = 0.1; % set threshold
d = zeros(maxlag,1); % init variable (d(tau))
d2 = zeros(maxlag,1); % init variable (d’(tau))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%                 Write your code here                        %%%%%%%
%%%%%%%                         _||_                                %%%%%%%
%%%%%%%                         \  /                                %%%%%%%
%%%%%%%                          \/                                 %%%%%%%
% Your job here is to implement Yin algorithm to detect the fundamental 
% frequency of a given frame. After calculating d’(tau) function, limit the
% search to the target range by minf0 and maxf0. Compute lags corresponding
% to these frequencies and set the values of d’(tau) in lags smaller than 
% the lag corresponding to maxf0 or lags greater than the lag corresponding 
% to minf0 to a high number like 100 to avoid detecting them as f0. Then rf
% find minima of this function (d’(tau)). Consider a threshold of 0.1 for  
% this function. Pick the first lag from the found set of minima that has 
% a smaller function value than the threshold(0.1). If none of the found 
% minima has smaller function value than the threshold, pick the lag 
% corresponding to the smallest function value. Now you have a candidate lag  
% value. Use the d’(tau) function values before and after the candidate lag 
% value to perform a parabolic interpolation in order to refine the candidate  
% lag value (find where the minimum of this interpolated parabola occurs and
% set it as the candidate lag value). At last compute candidate frequency
% in Hz by dividing the sampling frequency by candidate lag value. If the 
% minimum of d’(tau) function is greater than 0.2, set f0 to 0.


% Default code:
f0 = 0;
x = [x;zeros(ws,1)];

for T = 1 : maxlag

d(T )  = sum ((x(1:ws) - x((1+T):(ws+T))).^2);


d2(T ) = (T ) * d(T ) ./sum(sum (d(1:T)));
 
if ( T < fs/maxf0 || T > fs/minf0)
    d2(T)=100;
end

end

[func_val , candidate_lag]=min(d2);

if(func_val < 0.2)
    if(candidate_lag > 10 && candidate_lag < maxlag-9)
       interpolated_candidate      = polyfit((candidate_lag-4:candidate_lag+5),d2(candidate_lag-4:candidate_lag+5)',2);
      [func_val , idx]   = min(polyval(interpolated_candidate , linspace(candidate_lag-2,candidate_lag+2,9000001)));
      candidate_lag      = candidate_lag -2 + (idx -1)*0.000001;
    elseif(candidate_lag < 11 )
        interpolated_candidate      = polyfit((1:10),d2(1:10)',2);
      [func_val , idx]   = min(polyval(interpolated_candidate , linspace(1,5,9000001)));
      candidate_lag      = 1+(idx-1)*0.000001;
    elseif(candidate_lag > maxlag-10)
        interpolated_candidate      = polyfit((maxlag-9:maxlag)',d2(maxlag-9:maxlag),2);
      [func_val , idx]   = min(polyval(interpolated_candidate,linspace(maxlag-4,maxlag,9000001)));
      candidate_lag      = maxlag -4 +(idx-1)*0.000001;
    end
    
    f0=fs/(candidate_lag);

end
        
      
    

%%%%%%%                         /\                                  %%%%%%%
%%%%%%%                        /  \                                 %%%%%%%
%%%%%%%                         ||                                  %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

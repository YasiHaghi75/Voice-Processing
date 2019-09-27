function y = bh92transform(x,N)
% Calculate transform of the Blackman-Harris 92dB window
% x: bin positions to compute (real values)
% y: transform values
% N: DFT size

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%                 Write your code here                        %%%%%%%
%%%%%%%                         _||_                                %%%%%%%
%%%%%%%                         \  /                                %%%%%%%
%%%%%%%                          \/                                 %%%%%%%

% Your job is to calculate the Fourier transform of a zero-centered 
% Blackman-Harris 92 dB in given positions in the array x. At the end 
% normalize the transform valus by dividing them to (0.35875 * N).


% Default code:
y = zeros(1, length(x));
m = (0:N-1);
p = 2 * pi * m / N;
w = 0.35875 + 0.48829 * cos(p) + 0.14128 * cos(2*p) + 0.01168 * cos(3*p);
F = fft(ifftshift(w));
y = F(mod(x,N)+1)/(0.35875 .* N);

%%%%%%%                         /\                                  %%%%%%%
%%%%%%%                        /  \                                 %%%%%%%
%%%%%%%                         ||                                  %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

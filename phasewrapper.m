function [wrapped] = phasewrapper(unwrapped)
% [wrapped] = phasewrapper(unwrapped)
%
% This function takes as input a vector (here phase array)
% and wraps it into [-pi,pi] (rad).
%
% Input:
% unwrapped : Phase array to be wrapped
%
% Output:
% wrapped   : Wrapped version of unwrapped phase array

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%                 Write your code here                        %%%%%%%
%%%%%%%                         _||_                                %%%%%%%
%%%%%%%                         \  /                                %%%%%%%
%%%%%%%                          \/                                 %%%%%%%

% Your job is to change the code in a way that wraps the input array so the
% input would be principle argumet of the input. Plainly speaking, 
% you should write a code which wraps the input into [-pi,pi].
% The default code is written in order to avoid having errors.
% So, You have to change it!

% Available variable:
% unwrapped:                    Is the input phase array 
%
% Output of this part of code:
% wrapped:                      Is the wrapped output

% Default code:
wrapped = zeros(size(unwrapped));
wrapped =((unwrapped./pi-fix(unwrapped./pi))+(2*fix(fix(unwrapped./pi)/2)-fix(unwrapped./pi))).*pi;

%%%%%%%                         /\                                  %%%%%%%
%%%%%%%                        /  \                                 %%%%%%%
%%%%%%%                         ||                                  %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end


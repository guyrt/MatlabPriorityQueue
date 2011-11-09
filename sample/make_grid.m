function grid = make_grid(size, maxNumber, seed)

%% Return a grid of given size with random integers smaller than maxNumber.

if nargin < 2
    maxNumber = 10;
elseif nargin == 3
    % Set the random seed for testing.
    rand('seed',seed)
elseif nargin > 3
    error('Usage: make_grid(size, maxNumber)');
end

if length(size) < 2
   error('Size should be a vector of form [X Y]')
end

grid = floor(rand(size) * (maxNumber - 1)) + 1;
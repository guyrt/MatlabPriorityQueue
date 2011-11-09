function [grid, num_filled] = invperc_queue(grid)

%
% A queue based invasion percolation example.
%
% Author: Richard T. Guy
%
% Uses a queue of available slots.
%

FILLED = -1; % Used to denote a filled element.


queue = PriorityQueue();

[sI, sJ] = size(grid);
alreadyConsidered = sparse(sI, sJ);

grid( floor(sI/2) + 1 , floor(sJ/2) + 1 ) = FILLED;

alreadyConsidered = addElements(queue, grid, floor(sI/2)+1 , floor(sJ/2)+1, alreadyConsidered);
alreadyConsidered(floor(sI/2) + 1 , floor(sJ/2) + 1) = 1;

num_filled = 1;

while 1
    
    % 
    if queue.heapSize == 0
       error('Error in invperc_queue.m: no available grid cells.'); 
    end
    
    grid_index = queue.pop();
    grid(grid_index(1), grid_index(2)) = FILLED;
    num_filled = num_filled + 1;
    alreadyConsidered(grid_index(1), grid_index(2)) = 1;
    
    alreadyConsidered = addElements(queue, grid, grid_index(1), grid_index(2), alreadyConsidered);
    
    if grid_index(1) == 1 || grid_index(1) == sI ...
            || grid_index(2) == 1 || grid_index(2) == sJ
       break; 
    end
    
end

end

function alreadyConsidered = addElements(queue, grid, i, j, alreadyConsidered)

% Add elements nearby elements to the queue
[sI, sJ] = size(grid);

if i - 1 > 0 && alreadyConsidered(i-1,j) == 0
    queue.push(grid(i-1,j), [i-1 j]);
    alreadyConsidered(i-1,j) = 1;
end
if j-1 > 0 && alreadyConsidered(i,j-1) == 0
    queue.push(grid(i,j-1), [i j-1]);
    alreadyConsidered(i,j-1) = 1;
end

if i + 1 <= sI && alreadyConsidered(i+1,j) == 0
    queue.push(grid(i+1,j), [i+1 j]);
    alreadyConsidered(i+1,j) = 1;
end
if j + 1<= sJ && alreadyConsidered(i,j+1) == 0
    queue.push(grid(i,j+1), [i j+1]);
    alreadyConsidered(i,j+1) = 1;
end

end
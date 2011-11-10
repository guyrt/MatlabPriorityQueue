The Matlab priority queue was written by Richard T. Guy

Originally, this class was created as part of an (as yet unpublished)
lesson on object oriented programming in Matlab.

Special thanks to Greg Wilson and Software Carpentry for
financial assistance while writing this software. 

Also, thanks to Steve Eddins at Mathworks for assistance
in debugging and optimization.

This class is a simple, tree based pq. The code is offered as-is
but I welcome bug reports or improvements.

See the invperc_queue sample script in /samples/ for
an example of how to use the priority queue. 

After you add /src/ to your path, the two tests scripts in /t/
use xunit to test a few base cases.


Example: (you must add ../src/ to your path)
>> g = make_grid([10 10],10,1);
>> [newGrid numfilled] = invperc_queue(g)

newGrid =

     5     2     4     8     9     1     4     4     8     6
     5     5     4     4     4     6     4     2     9     1
     4     2     2     2     3     8     7     8     9     2
     1     7     1     6     9     3     2     9     6     9
     4     6     4     8     9     8     6     5     4     2
     7     4     8     2     5    -1    -1     9     7     3
     2     5     1     6     8     4    -1    -1    -1    -1
     1     5     3     2     2     8     3     3     6     3
     4     5     9     6     3     8     7     6     5     9
     1     6     3     8     6     2     2     2     5     3


numfilled =

     6
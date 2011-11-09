%
%  Priority Queue class for Matlab
%
%  Written by Richard T. Guy
%
%  Please credit original author in any derivative works.


classdef PriorityQueue < handle
    
   properties (Access=private)
       
       priority = [];
       data = [];
       userData = {};
       
       inputIndex = 1; % points to user data.
       
   end
   
   properties (SetAccess = private, GetAccess = public)
      heapSize = 0; % Store this so we avoid too much copying. 
   end
    
   methods
       
       function obj = PriorityQueue()
           
           obj.userData{1000} = 0;
           obj.priority = zeros(1000,1);
           obj.data = zeros(1000,1);
       end
       
       function s = size(obj)
          s = obj.heapSize; 
       end
       
       % Pop the best element and down-heap the rest.
       function [element_data,element_priority] = pop(obj)
           
           if obj.heapSize == 0
               error('Binary heap error: accessed empty heap.');
           end    
               
           element_data = obj.getUserData(obj.data(1));
           
           element_priority = obj.priority(1);
           obj.data(1) = obj.data(obj.heapSize);
           obj.priority(1) = obj.priority(obj.heapSize);
           obj.heapSize = obj.heapSize-1;
           
           % Now propagate down.
           i = 1;
           minChild = obj.replacementChildIndex(i);
           while minChild >= 0
               obj.swap(i, minChild);
               i = minChild;
               minChild = obj.replacementChildIndex(i);
           end
       
       end
       
       % Push element onto heap and swap to correct position.
       % element_priority is the "score"that this heap uses.
       % element_data is the thing that is stored.
       function push(obj, element_priority, element_data)
          
            obj.heapSize = obj.heapSize+1;
            
            obj.priority(obj.heapSize) = element_priority;
            obj.data(obj.heapSize) = obj.inputIndex;
            obj.userData{obj.inputIndex} = element_data;
            obj.inputIndex = obj.inputIndex +1;
            
            % Now propogate up.
            i = obj.heapSize;
            while i > 1 && (obj.priority(floor(i/2)) > obj.priority(i) || ...
                   (obj.priority(floor(i/2)) == obj.priority(i) && rand(1) < 0.50 ))
               
                obj.swap(i,floor(i/2));
                i = floor(i / 2);
                
            end
            
       end 
      
   end
  
   methods (Access=private)
       % swap two elements.
       function swap(obj, index1, index2)
          obj.priority([index1 index2]) = obj.priority([index2 index1]);
          obj.data([index1 index2]) = obj.data([index2 index1]);
       end
       % Check end conditions and return index of the minimum child.
       function child = replacementChildIndex(obj, idx)
           left = 2 * idx;
           right = 2 * idx + 1;
           if right <= obj.heapSize
               if obj.priority(left) < obj.priority(right) && ...
                       obj.priority(left) < obj.priority(idx)
                   
                   child = left;
               elseif obj.priority(right) < obj.priority(idx)
                   child = right;
               else
                   child = -1;
               end
           elseif left == obj.heapSize && obj.priority(left) < obj.priority(idx)
               child = left;
           else
               child = -1;
           end
       end
       
       function storedData = getUserData(obj,idx)
          storedData = obj.userData{idx}; 
       end
   end
   
   
end
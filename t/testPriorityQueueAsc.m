function testPriorityQueueAsc


p = PriorityQueue();
for i=1:10
   p.push(i,i); 
end

for i=1:10
   v = p.pop();
   assertEqual(v, i);
end

function testPriorityQueueDesc


p = PriorityQueue();
for i=10:-1:1
   p.push(i,i); 
end



for i=10:-1:1
   v = p.pop();
   assertEqual(v, 10-i+1);
end

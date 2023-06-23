fn fib = /x. if (x == 0) || (x == 1) 
              then 1
              else (fib (x - 1)) + (fib (x - 2));
             
fn fact = /x. if (x == 0) 
              then 1 
              else x * (fact (x - 1));
              
fact 4

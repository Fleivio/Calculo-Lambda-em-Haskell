//fibonacci
fn fib = /x -> if (x == 0) || (x == 1) 
              then 1
              else (fib (x - 1)) + (fib (x - 2));
           
//fatorial
fn fact = /x -> if (x == 0) 
              then 1 
              else x * (fact (x - 1));

//a
fn snd = /x,y -> y;

fn facta = fact;

fn infinity = /x -> 1 + (infinity x);

(snd (infinity 2)) 3

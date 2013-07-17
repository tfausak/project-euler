; http://projecteuler.net/problem=1

(println (reduce + (map
  (fn [n] (if (or (= 0 (rem n 3)) (= 0 (rem n 5))) n 0))
  (range 1 1000))))

(ns euler.problems.1)

(defn solve
  [x]
  (reduce + (map
    (fn [n] (if (or (= 0 (rem n 3)) (= 0 (rem n 5))) n 0))
    (range 1 x))))

(defn -main
  "https://projecteuler.net/problem=1"
  [x]
  (println (solve (bigdec x))))

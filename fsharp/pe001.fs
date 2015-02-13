// http://projecteuler.net/problem=1
[1 .. 1000]
  |> List.filter (fun x -> x % 3 = 0 || x % 5 = 0)
  |> List.sum
  |> printf "%d\n"

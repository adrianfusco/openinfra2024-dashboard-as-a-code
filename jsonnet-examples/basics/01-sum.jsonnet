local numbers = [5, 1, 2, 3];

std.foldl(
  function(x, y) (x + y),
  numbers,
  0
)

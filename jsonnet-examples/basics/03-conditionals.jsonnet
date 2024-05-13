local numbers = [1, 2, 3, 4, 5];

{
  numbers: [
    if n % 2 == 0 then
      {
        number: n,
        type: "even",
      }
    else
      {
        number: n,
        type: "odd",
      }
    for n in numbers
  ],
}

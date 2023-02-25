within MoGuide.algos;
model AlgorithmModel
  Real a(start = 10, fixed = true);
  Real a2(start = 10, fixed = true);
  Real a3(start = 10, fixed =true);
  Real b(start = 10, fixed = true);
equation
  der(b) = 0.5;
  when {sample(0, 2), b > 12} then
    a2 = if b <= 12 then pre(a2) +  1 else pre(a2) -1;
  end when;
algorithm
  when {sample(0, 2), b > 12} then
    a := if b <= 12 then a + 1 else a - 1;
  end when;
algorithm
  when sample(0,2) then
    a3 := a3 + 1;
  elsewhen b > 12 then
    a3 := a3 - 1;
  end when;
end AlgorithmModel;
within ISAExamples;

model LotkaVolterraFlat
  Real B(start = 10);
  Real R(start = 10);
  parameter Real gb = 0.1;
  parameter Real fb = 0.02;
  parameter Real sr = 0.4;
  parameter Real gr = 0.02;
equation
  der(B) = B * (gb - fb * R);
  der(R) = R * (gr * B - sr);
end LotkaVolterraFlat;
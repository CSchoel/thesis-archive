within MoGuide.ArrayFunctions;

model ArrayFunctionExample
  parameter Integer myparam = 5;
  parameter Real[5] something = MoGuide.ArrayFunctions.CreateArrayGood(myparam);
  Real x;
equation
  x = something[1];
end ArrayFunctionExample;
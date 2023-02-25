within MoGuide.ArrayFunctions;

function CreateArrayGood
  input Integer n "array size";
  output Real[n] out "output array"; //Output size given
algorithm
  out := fill(1, n);
end CreateArrayGood;
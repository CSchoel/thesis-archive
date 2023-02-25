within MoGuide.ArrayFunctions;

function CreateArrayBad
  input Integer n "array size";
  output Real[:] out "output array"; //output size unknown until algorithm is called => code generation fails
algorithm
  out := fill(1, n);
end CreateArrayBad;
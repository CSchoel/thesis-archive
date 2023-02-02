within ISAExamples;

model DynamicExampleWrong
  Real temp(start = 0);
  Boolean cool(start = false);
equation
  if time > 5 then
    der(temp) = -0.3 * temp;
  else
    temp = time * time + 4;
  end if;
end DynamicExampleWrong;
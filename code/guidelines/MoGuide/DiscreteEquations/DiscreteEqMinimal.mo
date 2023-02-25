within MoGuide.DiscreteEquations;
model DiscreteEqMinimal
  Real last(start=1, fixed = true);
equation
  when time > last + 1 then
    last = time;
  end when;
end DiscreteEqMinimal;

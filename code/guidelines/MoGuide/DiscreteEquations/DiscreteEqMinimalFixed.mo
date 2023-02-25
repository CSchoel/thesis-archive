within MoGuide.DiscreteEquations;
model DiscreteEqMinimalFixed
  Real last(start=1, fixed = true);
equation
  when time > pre(last) + 1 then
    last = time;
  end when;
end DiscreteEqMinimalFixed;

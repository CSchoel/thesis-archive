within ISAExamples;

model IntegrateAndFireExample
  Real x(start = 0);
  Real dx(start = 0);
  Boolean state(start = true);
equation
  der(x) = dx;
  der(dx) = 1;
  when x > 1 then
    reinit(x, 0);
    state = not pre(state);
  end when;
end IntegrateAndFireExample;
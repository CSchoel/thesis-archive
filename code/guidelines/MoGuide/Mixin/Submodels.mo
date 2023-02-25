within MoGuide.Mixin;
model Submodels
  model CycleLike
    Real phase;
    Boolean clock;
  equation
    when phase >= 1 then
      reinit(phase, 0);
      clock = not pre(clock);
    end when;
  end CycleLike;
  model CounterLike
    Real counter;
    Boolean count_signal;
  protected
    Real increment;
  equation
    when count_signal then
      counter = pre(counter) + increment;
    end when;
  end CounterLike;
  model ConstantCounterLike
    extends CounterLike;
    parameter Real increment_constant = 1;
  equation
    increment = increment_constant;
  end ConstantCounterLike;
  model CycleCounter
    Real phase = cy.phase;
    Boolean clock = cy.clock;
    Real counter = co.counter;
    Boolean count_signal = co.count_signal;
    CycleLike cy;
    ConstantCounterLike co;
  equation
    der(cy.phase) = 1;
    count_signal = edge(clock);
  end CycleCounter;
  CycleCounter cc;
end Submodels;

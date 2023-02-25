within MoGuide.Mixin;
model MultipleInheritance
  partial model CycleLike
    Real phase;
    Boolean clock;
  equation
    when phase >= 1 then
      reinit(phase, 0);
      clock = not pre(clock);
    end when;
  end CycleLike;
  partial model CounterLike
    Real counter;
    Boolean count_signal;
  protected
    Real increment;
  equation
    when count_signal then
      counter = pre(counter) + increment;
    end when;
  end CounterLike;
  model CycleCounter
    extends CycleLike;
    extends CounterLike;
  equation
    increment = 1;
    der(phase) = 1;
    count_signal = edge(clock);
  end CycleCounter;
  CycleCounter cc;
end MultipleInheritance;

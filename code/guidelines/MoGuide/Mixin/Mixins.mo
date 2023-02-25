within MoGuide.Mixin;
// todo probably should be a package and not a model
model Mixins
  model CycleLike
    outer Real phase;
    outer Boolean clock;
  equation
    when phase >= 1 then
      reinit(phase, 0);
      clock = not pre(clock);
    end when;
  end CycleLike;
  model CounterLike
    outer Real counter;
    outer Boolean count_signal;
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
    inner Real phase;
    inner Boolean clock;
    inner Real counter;
    inner Boolean count_signal;
    CycleLike cy;
    ConstantCounterLike co;
  equation
    der(phase) = 1;
    count_signal = edge(clock);
  end CycleCounter;
  CycleCounter cc;
end Mixins;

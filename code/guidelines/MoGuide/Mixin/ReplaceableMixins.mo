within MoGuide.Mixin;
model ReplaceableMixins
  model CycleLike
    outer Real phase;
    outer Boolean clock;
  equation
    when phase >= 1 then
      reinit(phase, 0);
      clock = not pre(clock);
    end when;
  end CycleLike;
  model ConstantCycleLike
    extends CycleLike;
    parameter Real T = 1;
  equation
    der(phase) = 1/T;
  end ConstantCycleLike;
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
    replaceable CycleLike cy;
    replaceable CounterLike co;
  equation
    count_signal = edge(clock);
  end CycleCounter;
  CycleCounter cc(
    redeclare ConstantCycleLike cy(T=0.5),
    redeclare ConstantCounterLike co
  );
end ReplaceableMixins;

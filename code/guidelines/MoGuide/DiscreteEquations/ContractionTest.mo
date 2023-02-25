within MoGuide.DiscreteEquations;
model ContractionTest
  Real slowPhase;
  Real fastPhase;
  Boolean signal;
  discrete Real duration;
  Boolean signal_received;
  discrete Real cont_last;
  discrete Real sig_last;
equation
  signal = if time < 5 then sample(0,1) else if time < 10 then sample(0,3) else sample(0,0.1);
  der(slowPhase) = 1/1.7;
  der(fastPhase) = if signal_received then 1/duration else 0;
  signal_received = sig_last > cont_last;
  when signal then
    sig_last = time;
    duration = (1-sin(time))*0.1;
  end when;
  when slowPhase > 1 or fastPhase > 1 then
    cont_last = time;
    reinit(slowPhase,0);
    reinit(fastPhase,0);
  end when;
end ContractionTest;
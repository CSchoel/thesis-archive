within MoGuide.DiscreteEquations;
model DiscreteEquationsExampleWorking
  discrete Real t_next;
  discrete Real t_last;
  Boolean signal;
  Real av_phase;
  Real refrac_time;
  Boolean cond_sig;
initial equation
  t_next = 1.5;
  t_last = 0;
  av_phase = 0;
  refrac_time = 1;
equation
  der(refrac_time) = if refrac_time > 0 then -1 else 0;
  der(av_phase) = 1/2.0;
  signal = if time < 5 then sample(0,1) else sample(0,3);
  cond_sig = signal and refrac_time <= 0;
  when  cond_sig then
    t_next = time + (1-sin(time*0.1));
  elsewhen av_phase >= 1 then
    t_next = time + 1e22;
  end when;
  when time > t_next then //if you need two seperate events, do not combine them with or but use elsewhen!
    t_last = time;
    reinit(av_phase,0);
    reinit(refrac_time,1);
  elsewhen av_phase >= 1 then
    t_last = time;
    reinit(av_phase,0);
    reinit(refrac_time,1);
  end when;
end DiscreteEquationsExampleWorking;
/* This is a bad hack that replaces discrete variables that are used in equation systems
 * with continuous phase variables that are reset using reinit.
 */
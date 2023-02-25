within MoGuide.DiscreteEquations;
model DiscreteEquationsExample2
  parameter Real T_refrac = 0.9;
  parameter Real tau_av = 2;
  discrete Real t_last;
  discrete Real T_avc;
  Boolean signal;
  Boolean contraction;
  Boolean av_contraction;
  Boolean sinus_contraction;
  Real T_passed;
  Real av_phase;
  Real sinus_phase;
  Real refrac_countdown;
initial equation
  t_last = 0;
  refrac_countdown = 0;
  sinus_phase = 0;
  av_phase = 0;
equation
  der(av_phase) = 1/tau_av;
  der(refrac_countdown) = if refrac_countdown > 0 then -1/T_refrac else 0;
  der(sinus_phase) = if T_avc > 0 then 1/T_avc else 0;
  contraction = av_contraction or sinus_contraction;
  av_contraction = av_phase >= 1;
  sinus_contraction = sinus_phase >= 1;
  T_passed = time - t_last;
  signal = if time < 5 then sample(0,1) else sample(0,3);
  when signal and refrac_countdown <= 0 then
    T_avc = 0.1*(1-sin(T_passed*0.1));
  elsewhen contraction then
    T_avc = 0;
  end when;
  when contraction then
    t_last = time;
    reinit(av_phase,0);
    reinit(sinus_phase,0);
    reinit(refrac_countdown,T_refrac);
  end when;
end DiscreteEquationsExample2;
/* second working example that has cleaner code compared to DiscreteEquationsExampleWorking
 */

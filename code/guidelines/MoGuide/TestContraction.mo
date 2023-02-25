within MoGuide;
model TestContraction "contraction model for the heart"
  parameter String outfile = "heartbeats.csv";
  parameter Real T_refrac = 0.9 "refractory period that has to pass until a signal from the sinus node can take effect again";
  parameter Real T_av = 1.7 "av-node cycle duration";
  parameter Real initial_T = 1 "initial value for T";
  parameter Real initial_cont_last = 0 "initial value for last ventricular contraction time";
  parameter Real k_av_t = 0.78 "sensitivity of the atrioventricular conduction time to the time passed since the last ventricular conduction";
  parameter Real T_avc0 = 0.09 "base value for atrioventricular conduction time";
  parameter Real tau_av = 0.11 "reference time for atrioventricular conduction time"; //TODO find better description
  parameter Real initial_T_avc = 0.15 "initial value for atrioventricular conduction delay";
  discrete Real cont_last "time of last contraction";
  discrete Real T_avc "atrioventricular conduction time (delay for sinus signal to trigger contraction)";
  Boolean signal "the sinus signal";
  output Boolean contraction "true when a contraction is triggered";
  output Boolean av_contraction "true when the av-node triggers a contraction";
  output Boolean sinus_contraction "true when the sinus node triggers a contraction";
  discrete output Real T "duration of last heart cycle";
  Boolean signal_received "true, if a sinus signal has already been received since the last contraction";
  Boolean refrac;
  discrete Real sig_last "time of last received sinus signal";
  Real T_passed;
initial equation
  cont_last = initial_cont_last;
  sig_last = 0;
  T = initial_T;
  T_avc = initial_T_avc;
equation
  if time < 5 then
    signal = sample(0,1);
  elseif time < 15 then
    signal = sample(0,3);
  else
    signal = sample(0,0.05);
  end if;
  T_passed = time - cont_last;
  signal_received = sig_last > cont_last;
  refrac = T_passed < T_refrac;
  av_contraction = T_passed > T_av;
  sinus_contraction = signal_received and time > sig_last + T_avc;
  contraction = av_contraction or sinus_contraction;
  when signal and not signal_received and not refrac then
    T_avc = T_avc0 + k_av_t * exp(-T_passed/tau_av);
    sig_last = time;
    T = time-pre(sig_last);
  end when;
  when contraction then
    cont_last = time;
  end when;
end TestContraction;
within MoGuide.DiscreteEquations;
model DiscreteEquationsExample
  discrete Real t_next;
  discrete Real t_last;
  Boolean signal;
equation
  signal = if time < 5 then sample(0,1) else sample(0,3);
  when signal and time > t_last + 1 then
    t_next = min(t_next,time + sin(time*0.1)*4);
    t_last = pre(t_last);
  elsewhen time > t_next then
    t_next = time + 2;
    t_last = time;
  end when;
end DiscreteEquationsExample;
/* Produces Error that actually represents a shortcoming of the modelica compiler:
[:0:0-0:0] Error: Interner Fehler ./Compiler/BackEnd/BackendDAETransform.mo: function analyseStrongComponentBlock failed
Sorry - Support for Discrete Equation Systems is not yet implemented
t_last
t_next
when signal and time > 1.0 + t_last then
  t_next := min(t_next, time + 4.0 * sin(0.1 * time))
elsewhen time > t_next then
  t_next := 2.0 + time
end when
when signal and time > 1.0 + t_last then
  t_last := pre(t_last)
elsewhen time > t_next then
  t_last := time
end when
 */

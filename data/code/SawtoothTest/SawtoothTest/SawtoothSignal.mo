within SawtoothTest;
model SawtoothSignal
  Real r(start=0);
equation
  when r > 1 then
    reinit(r,0);
  end when;
  der(r) = 1;
end SawtoothSignal;

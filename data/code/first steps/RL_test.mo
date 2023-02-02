model RL_test
  Modelica.Electrical.Analog.Basic.Resistor R1(R = 100) annotation(Placement(visible = true, transformation(origin = {-35.1648,61.0989}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor I1(L = 1) annotation(Placement(visible = true, transformation(origin = {32.5275,60.6593}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-69.011,-16.2637}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sinevoltage1 annotation(Placement(visible = true, transformation(origin = {-68.5714,26.8132}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(sinevoltage1.n,I1.n) annotation(Line(points = {{-68.5714,14.8132},{44.8352,14.8132},{44.8352,60.6593},{44.5275,60.6593}}));
  connect(ground1.p,sinevoltage1.n) annotation(Line(points = {{-69.011,-4.26374},{-69.011,14.9451},{-68.5714,14.9451},{-68.5714,14.8132}}));
  connect(sinevoltage1.p,R1.p) annotation(Line(points = {{-68.5714,38.8132},{-68.5714,38.8132},{-68.5714,61.0989},{-47.1648,61.0989}}));
  connect(R1.n,I1.p) annotation(Line(points = {{-23.1648,61.0989},{20.6593,61.0989},{20.6593,60.6593},{20.5275,60.6593}}));
end RL_test;


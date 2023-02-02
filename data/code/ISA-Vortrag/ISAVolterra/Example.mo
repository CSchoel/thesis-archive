within ISAVolterra;

model Example
  ISAVolterra.Predation predation1(gR = 0.02, fr = 0.02) annotation(Placement(visible = true, transformation(origin = {-15.6617, 40.5779}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ISAVolterra.Starvation starvation1(sr = 0.4) annotation(Placement(visible = true, transformation(origin = {-81.39319999999999, 14.9498}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ISAVolterra.RegionalPopulation Woelfe annotation(Placement(visible = true, transformation(origin = {-59.5618, 15.1871}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ISAVolterra.Reproduction reproduction1(gr = 0.1) annotation(Placement(visible = true, transformation(origin = {62.4094, 15.1871}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ISAVolterra.RegionalPopulation Hasen annotation(Placement(visible = true, transformation(origin = {35.34, 15.4629}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Woelfe.p, starvation1.p) annotation(Line(points = {{-59.8574, 25.1793}, {-59.7991, 25.1793}, {-59.7991, 37.7304}, {-81.39319999999999, 37.7304}, {-81.39319999999999, 21.1195}, {-81.39319999999999, 21.1195}}));
  connect(predation1.r, Woelfe.p) annotation(Line(points = {{-25.5914, 40.6716}, {-59.7991, 40.6716}, {-59.7991, 25.3909}, {-59.7991, 25.3909}}));
  connect(Hasen.p, predation1.b) annotation(Line(points = {{35.0443, 25.4551}, {35.1201, 25.4551}, {35.1201, 40.5779}, {-5.22055, 40.5779}, {-5.22055, 40.5779}}));
  connect(Hasen.p, reproduction1.p) annotation(Line(points = {{35.0443, 25.4551}, {35.1201, 25.4551}, {35.1201, 38.6796}, {62.6467, 38.6796}, {62.6467, 25.1536}, {62.6467, 25.1536}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Example;
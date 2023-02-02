within HackVolterra;

model Example
  HackVolterra.RegionalPopulation BlutigerSchneemann(initial_pop = 10) annotation(Placement(visible = true, transformation(origin = {-48.3069, -14.8144}, extent = {{-14.136, -14.136}, {14.136, 14.136}}, rotation = 0)));
  HackVolterra.RegionalPopulation Hasen(initial_pop = 10) annotation(Placement(visible = true, transformation(origin = {45.9414, -13.1297}, extent = {{-14.3323, -14.3323}, {14.3323, 14.3323}}, rotation = 0)));
  HackVolterra.Starvation starvation1(sr = 0.4) annotation(Placement(visible = true, transformation(origin = {-81.6305, -14.9498}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HackVolterra.Reproduction reproduction1(gr = 0.1) annotation(Placement(visible = true, transformation(origin = {82.10509999999999, -12.8141}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HackVolterra.Predation predation1(fr = 0.02, gr = 0.02) annotation(Placement(visible = true, transformation(origin = {-2.37298, 6.88164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(predation1.beuterich, Hasen.rpop) annotation(Line(points = {{7.55676, 6.97532}, {44.8493, 6.97532}, {44.8493, 1.42379}, {46.2731, 1.42379}, {46.2731, 1.42379}}));
  connect(BlutigerSchneemann.rpop, predation1.raeuber) annotation(Line(points = {{-48.4393, -0.7777269999999999}, {-47.9342, -0.7777269999999999}, {-47.9342, 6.40704}, {-12.3395, 6.40704}, {-12.3395, 6.40704}}));
  connect(reproduction1.p, Hasen.rpop) annotation(Line(points = {{82.19880000000001, -2.88435}, {81.8678, -2.88435}, {81.8678, 17.3228}, {45.7985, 17.3228}, {45.7985, 1.42379}, {45.7985, 1.42379}}));
  connect(BlutigerSchneemann.rpop, starvation1.p) annotation(Line(points = {{-48.4393, -0.7777269999999999}, {-49.358, -0.7777269999999999}, {-49.358, 8.78002}, {-81.6305, 8.78002}, {-81.6305, -5.22055}, {-81.6305, -5.22055}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Example;
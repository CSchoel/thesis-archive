within LotkaVolterra2;

model Example
  LotkaVolterra2.RegionalPopulation Rabbits(initial_population = 10) annotation(Placement(visible = true, transformation(origin = {45.5527, 26.4841}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Starvation starvation1(dr = 0.4) annotation(Placement(visible = true, transformation(origin = {-70.3411, 12.5729}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Reproduction reproduction1(br = 0.1) annotation(Placement(visible = true, transformation(origin = {72.4415, 10.6461}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.RegionalPopulation Foxes(initial_population = 10) annotation(Placement(visible = true, transformation(origin = {-41.5165, 25.6367}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Predation predation1(er = 0.02, rr = 0.02) annotation(Placement(visible = true, transformation(origin = {1.72678, 41.0928}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Rabbits.pop, reproduction1.pop) annotation(Line(points = {{45.5527, 36.4841}, {45.8287, 36.4841}, {45.8287, 51.6129}, {72.525, 51.6129}, {72.525, 20.9121}, {72.525, 20.9121}}));
  connect(predation1.pop_prey, Rabbits.pop) annotation(Line(points = {{11.7268, 41.0928}, {45.8287, 41.0928}, {45.8287, 36.485}, {45.8287, 36.485}}));
  connect(Foxes.pop, predation1.pop_pred) annotation(Line(points = {{-41.5165, 35.6367}, {-41.3793, 35.6367}, {-41.3793, 40.9344}, {-8.67631, 40.9344}, {-8.67631, 40.9344}}));
  connect(starvation1.pop, Foxes.pop) annotation(Line(points = {{-70.3411, 22.5729}, {-70.3003, 22.5729}, {-70.3003, 42.4917}, {-41.3793, 42.4917}, {-41.3793, 35.8176}, {-41.3793, 35.8176}}));
end Example;
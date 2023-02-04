within LotkaVolterra2;

model ExampleThesis
  LotkaVolterra2.RegionalPopulation hares annotation(
    Placement(visible = true, transformation(origin = {80, 28}, extent = {{-16, 16}, {16, -16}}, rotation = 0)));
  LotkaVolterra2.RegionalPopulation lynxes annotation(
    Placement(visible = true, transformation(origin = {40, -76}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  LotkaVolterra2.RegionalPopulation wolves annotation(
    Placement(visible = true, transformation(origin = {-40, -76}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  LotkaVolterra2.Starvation wolf_death annotation(
    Placement(visible = true, transformation(origin = {-80, -76}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  LotkaVolterra2.Reproduction hare_birth annotation(
    Placement(visible = true, transformation(origin = {80, -32}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  LotkaVolterra2.Predation lynxes_eat_hares annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  LotkaVolterra2.Predation wolves_eat_hares annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  LotkaVolterra2.Predation wolves_eat_lynxes annotation(
    Placement(visible = true, transformation(origin = {0, -44}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(wolf_death.pop, wolves.pop) annotation(
    Line(points = {{-80, -60}, {-80, -50}, {-40, -50}, {-40, -60}}));
  connect(wolves.pop, wolves_eat_lynxes.pop_pred) annotation(
    Line(points = {{-40, -60}, {-40, -44}, {-16, -44}}));
  connect(wolves_eat_lynxes.pop_prey, lynxes.pop) annotation(
    Line(points = {{16, -44}, {40, -44}, {40, -60}}));
  connect(hare_birth.pop, hares.pop) annotation(
    Line(points = {{80, -16}, {80, 12}}));
  connect(wolves.pop, wolves_eat_hares.pop_pred) annotation(
    Line(points = {{-40, -60}, {-40, 0}, {-14, 0}}));
  connect(wolves_eat_hares.pop_prey, hares.pop) annotation(
    Line(points = {{18, 0}, {80, 0}, {80, 12}}));
  connect(lynxes_eat_hares.pop_prey, hares.pop) annotation(
    Line(points = {{40, -4}, {40, 0}, {80, 0}, {80, 12}}));
  connect(lynxes.pop, lynxes_eat_hares.pop_pred) annotation(
    Line(points = {{40, -60}, {40, -36}}));
end ExampleThesis;
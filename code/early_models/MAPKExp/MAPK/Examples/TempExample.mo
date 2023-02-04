within MAPK.Examples;
model TempExample
  MAPK.Components.Substance substance1(initial_amount = 10) annotation(Placement(visible = true, transformation(origin = {12.5224,49.7317}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Consumption consumption1 annotation(Placement(visible = true, transformation(origin = {28.2648,-15.7424}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(consumption1.subst,substance1.n) annotation(Line(points = {{28.2648,-15.7424},{12.5224,-15.7424},{12.5224,47.9428},{12.5224,47.9428}}));
end TempExample;


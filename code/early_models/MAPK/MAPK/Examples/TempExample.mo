within MAPK.Examples;
model TempExample
  MAPK.Components.Substance Test(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {-39.1546,43.8265}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.JumpSignal jumpsignal1 annotation(Placement(visible = true, transformation(origin = {-75.1947,47.8309}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(jumpsignal1.subst,Test.subst) annotation(Line(points = {{-65.1897,52.4644},{-38.4872,52.4644},{-38.4872,42.4917},{-38.4872,42.4917}}));
  annotation(Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {-39.822,45.3838}, points = {{0,0}})}));
end TempExample;


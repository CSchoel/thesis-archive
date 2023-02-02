within MAPK.Components;
model Substance "A chemical substance"
  parameter Real initial_amount(start = 1) "Initial amount of substance";
  SubstanceAmount subst annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-90,-90},{90,90}})));
initial equation
  subst.amount = initial_amount;
equation
  der(subst.amount) = subst.rate;
  assert(subst.amount > 0, "Negative amount of substance!");
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Text(origin = {0,-100}, extent = {{-100,0},{100,-40}}, textString = "%name")}));
end Substance;


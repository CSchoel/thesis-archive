within MAPK.Components;
model Consumption
  SubstanceAmount subst annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-90,-90},{90,90}})));
  parameter Real crate = 0.5;
equation
  subst.rate = crate;
end Consumption;


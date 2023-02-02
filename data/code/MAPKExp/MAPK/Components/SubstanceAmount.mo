within MAPK.Components;
connector SubstanceAmount "Connector for the flow of substances"
  Real amount "Substance amount";
  flow Real rate "Flow rate of substance";
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {0,0}, rotation = 45, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, extent = {{-70,70},{70,-70}}),Rectangle(origin = {0,0}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, extent = {{-70,70},{70,-70}})}));
end SubstanceAmount;


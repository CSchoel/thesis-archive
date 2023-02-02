within LotkaVolterra2;

model Predation
  parameter Real er "eat rate of predator per prey";
  parameter Real rr "reproduction rate of predator per prey";
  Population pop_pred annotation(Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Population pop_prey annotation(Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  pop_prey.rate = er * pop_pred.population * pop_prey.population;
  pop_pred.rate = -rr * pop_prey.population * pop_pred.population;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(extent = {{-120, -100}, {120, -120}}, textString = "%name"), Ellipse(origin = {37.3061, 1.61002}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-17.5313, 17.3524}, {17.5313, -17.3524}}), Ellipse(origin = {-62.3922, 13.2424}, fillPattern = FillPattern.Solid, extent = {{-6.11189, 5.85723}, {6.11189, -5.85723}}), Rectangle(origin = {-36, 14}, rotation = 25, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-38, 2}, {38, -2}}), Polygon(origin = {-51, 2}, rotation = -15, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-39, 8}, rotation = -15, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-27, 14}, rotation = -15, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-15, 20}, rotation = -15, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-3, 26}, rotation = -15, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Rectangle(origin = {-36, -18}, rotation = -25, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-38, 2}, {38, -2}}), Polygon(origin = {-53, -8}, rotation = 195, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-41, -12}, rotation = 195, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-29, -18}, rotation = 195, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-17, -24}, rotation = 195, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}}), Polygon(origin = {-5, -30}, rotation = 195, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-3, 4}, {1, 4}, {-1, -4}, {-1, -4}, {-3, 4}})}));
end Predation;
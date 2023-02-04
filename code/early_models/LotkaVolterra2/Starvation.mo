within LotkaVolterra2;

model Starvation
  Population pop annotation(Placement(transformation(extent = {{-10, 90}, {10, 110}})));
  parameter Real dr "death rate";
equation
  pop.rate = dr * pop.population;
//flow out of the system
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0, 50}, fillColor = {103, 184, 248}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 50}, {100, -50}}), Rectangle(origin = {0, -50}, fillColor = {245, 194, 17}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 50}, {100, -50}}), Text(extent = {{-100, -120}, {100, -120}}, textString = "%name"), Rectangle(extent = {{-100, -100}, {100, 100}}), Ellipse(origin = {-2.33, -1.61}, fillColor = {192, 191, 188}, fillPattern = FillPattern.Solid, extent = {{-67.44, 65.65}, {67.44, -65.65}}), Ellipse(origin = {-35.78, 24.15}, extent = {{-16.82, 16.28}, {16.82, -16.28}}), Ellipse(origin = {28.23, 24.47}, extent = {{-16.82, 16.28}, {16.82, -16.28}}), Line(origin = {-5.19, -31.82}, points = {{-39.5345, -0.0183411}, {-31.3056, 7.85286}, {-22.0032, -6.81619}, {-8.40752, 3.55948}, {-0.178543, -8.96288}, {12.3438, 3.91726}, {22.0039, -7.17398}, {29.8751, 8.9262}, {39.5352, -0.0183411}}), Line(origin = {-35.78, 24.69}, points = {{-10.3757, 13.5957}, {10.3757, -13.5957}}), Line(origin = {-35.6, 23.61}, points = {{-13.059, -11.449}, {13.059, 11.449}}), Line(origin = {29.12, 23.58}, points = {{-13.059, -11.449}, {13.059, 11.449}}), Line(origin = {28.94, 25.37}, points = {{-10.3757, 13.5957}, {10.3757, -13.5957}}), Ellipse(origin = {76, 77}, fillColor = {248, 228, 92}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-22, 21}, {22, -21}})}));
end Starvation;
within HackVolterra;

model RegionalPopulation
  HackVolterra.Population rpop annotation(Placement(visible = true, transformation(origin = {-11.7096, 29.0398}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-0.936768, 99.2974}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real initial_pop(start = 10);
initial equation
  rpop.pop = initial_pop;
equation
  rpop.rate = der(rpop.pop);
  annotation(Placement(transformation(extent = {{-10, 90}, {10, 110}})), Placement(transformation(extent = {{-10, 90}, {10, 110}})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100.179, 99.8211}}), Ellipse(origin = {-7.69231, 47.585}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}, endAngle = 360), Ellipse(origin = {57.0304, 35.7424}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}, endAngle = 360), Ellipse(origin = {-42.1109, -51.5921}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}, endAngle = 360), Ellipse(origin = {50.5188, -31.5921}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}, endAngle = 360), Ellipse(origin = {-59.2487, 18.2111}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}, endAngle = 360), Ellipse(origin = {-7.08408, -9.767440000000001}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}, endAngle = 360), Text(origin = {1.07335, -81.0376}, extent = {{-92.66549999999999, 34.1682}, {93.7389, -13.0591}}, textString = "%name")}));
end RegionalPopulation;
within LotkaVolterra2;

model RegionalPopulation
  Population pop annotation(Placement(transformation(extent = {{-10, 90}, {10, 110}})));
  parameter Real initial_population;
protected
  Real population(start = 10) = pop.population;
initial equation
  population = initial_population;
equation
  der(population) = pop.rate;
  assert(population >= 0, "Population went negative!");
  annotation(Placement(transformation(extent = {{-10, 90}, {10, 110}})), Placement(transformation(extent = {{-10, 90}, {10, 110}})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(fillColor = {0, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100.179, 99.8211}}), Ellipse(origin = {-7.69231, 47.585}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}), Ellipse(origin = {57.0304, 35.7424}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}), Ellipse(origin = {-46.1109, -31.5921}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}), Ellipse(origin = {50.5188, -31.5921}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}), Ellipse(origin = {-59.2487, 18.2111}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}), Ellipse(origin = {2.91592, -1.76744}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-13.059, 12.1646}, {9.48122, -10.3757}}), Text(origin = {1.07335, -87.0376}, extent = {{-92.6655, 34.1682}, {93.7389, -13.0591}}, textString = "%name")}));
end RegionalPopulation;
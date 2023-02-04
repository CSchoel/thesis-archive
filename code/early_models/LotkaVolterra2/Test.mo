within LotkaVolterra2;

model Test
  LotkaVolterra2.Population p;
equation
  //this does not work, because Population is an unconnected connector with a flow variable
  //modelica will therefore generate a connection set containing only this connector which will
  //result in the equation (p.rate = 0) which is an additional equation added that makes
  //the manual equation (p.rate = 1) redundant
  p.rate = der(p.population);
  p.rate = 1;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 10, Tolerance = 0.000001));
end Test;
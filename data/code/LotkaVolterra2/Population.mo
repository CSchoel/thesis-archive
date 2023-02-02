within LotkaVolterra2;

connector Population "Connector for Animal populations"
  Real population;
  flow Real rate;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0, 0}, rotation = 45, fillColor = {255, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 70}, {70, -70}})}));
end Population;
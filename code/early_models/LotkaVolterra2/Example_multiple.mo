within LotkaVolterra2;

model Example_multiple
  LotkaVolterra2.Predation predation2(er = 0.02, rr = 0.01) annotation(Placement(visible = true, transformation(origin = {32.2581, 79.644}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.RegionalPopulation Foxes(initial_population = 10) annotation(Placement(visible = true, transformation(origin = {-42.2692, -23.1368}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Predation predation1(er = 0.2, rr = 0.2) annotation(Placement(visible = true, transformation(origin = {1.77976, 10.0111}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Starvation starvation2(dr = 0.5) annotation(Placement(visible = true, transformation(origin = {-86.0957, 79.4216}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Reproduction reproduction1(br = 0.1) annotation(Placement(visible = true, transformation(origin = {82.7587, -10.6785}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Starvation starvation1(dr = 0.4) annotation(Placement(visible = true, transformation(origin = {-76.7519, -26.9188}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.RegionalPopulation Wolves(initial_population = 10) annotation(Placement(visible = true, transformation(origin = {-59.8443, 78.7542}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.RegionalPopulation Rabbits(initial_population = 10) annotation(Placement(visible = true, transformation(origin = {50.0556, -4.22692}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LotkaVolterra2.Predation predation3(er = 0.04, rr = 0.08) annotation(Placement(visible = true, transformation(origin = {-52.7252, 35.5951}, extent = {{-14.1421, 0}, {14.1421, 0}}, rotation = -45)));
equation
  connect(predation3.pop_prey, Foxes.pop) annotation(Line(points = {{-45.6542, 28.5241}, {-45.6542, 6.45161}, {-42.0467, 6.45161}, {-42.0467, -12.9032}, {-42.0467, -12.9032}}));
  connect(predation3.pop_pred, Wolves.pop) annotation(Line(points = {{-59.7963, 42.6662}, {-59.7963, 88.7653}, {-60.0667, 88.7542}, {-59.8443, 88.7542}}));
  connect(Wolves.pop, predation2.pop_pred) annotation(Line(points = {{-59.8443, 88.7542}, {-59.6218, 88.7542}, {-59.6218, 91.8799}, {4.67186, 91.8799}, {4.67186, 79.1991}, {22.2581, 79.1991}, {22.2581, 79.644}}));
  connect(starvation2.pop, Wolves.pop) annotation(Line(points = {{-86, 89}, {-85.8732, 89}, {-85.8732, 96.3293}, {-59.6218, 96.3293}, {-59.6218, 88.7542}, {-59.8443, 88.7542}}));
  connect(Rabbits.pop, predation1.pop_prey) annotation(Line(points = {{50.0556, 5.77308}, {12.4583, 5.77308}, {12.4583, 9.78865}, {12.4583, 9.78865}}));
  connect(Rabbits.pop, reproduction1.pop) annotation(Line(points = {{50.0556, 5.77308}, {83.6485, 5.77308}, {83.6485, -1.33482}, {83.6485, -1.33482}}));
  connect(Foxes.pop, starvation1.pop) annotation(Line(points = {{-42.2692, -13.1368}, {-75.8621, -13.1368}, {-76.7519, -12.6919}, {-76.7519, -16.9188}}));
  connect(Foxes.pop, predation1.pop_pred) annotation(Line(points = {{-42.2692, -13.1368}, {-8.23137, -13.1368}, {-8.23137, 9.34372}, {-8.23137, 9.34372}}));
  connect(predation2.pop_prey, Rabbits.pop) annotation(Line(points = {{42.2581, 79.644}, {50.0556, 79.644}, {50.0556, 6.22914}, {50.0556, 6.22914}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Example_multiple;
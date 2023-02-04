within MAPK.Examples;
model ComponentModel
  MAPK.Components.Substance ATP(initial_amount = 100000) annotation(Placement(visible = true, transformation(origin = {85.1638,87.0906}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP4K(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {-86.8979,87.6686}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP2K(initial_amount = 10000) annotation(Placement(visible = true, transformation(origin = {-63.7765,3.85356}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP1K(initial_amount = 10000) annotation(Placement(visible = true, transformation(origin = {-52.4085,-34.104}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Reaction2to1BiAct reaction2to1biact3(k = 0.001) annotation(Placement(visible = true, transformation(origin = {-41.8112,3.46821}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Reaction2to1BiAct reaction2to1biact4(k = 0.001) annotation(Placement(visible = true, transformation(origin = {15.4143,2.6975}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Reaction2to1BiAct reaction2to1biact5(k = 0.001) annotation(Placement(visible = true, transformation(origin = {-21.1946,-35.6455}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Reaction2to1BiAct reaction2to1biact6(k = 0.001) annotation(Placement(visible = true, transformation(origin = {41.6185,-36.8015}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP2KP(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {-12.9006,4.04624}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP2KPP(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {44.0515,4.26871}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP3KP(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {-29.5008,46.3321}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP3K(initial_amount = 10000) annotation(Placement(visible = true, transformation(origin = {-84.5549,45.5112}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAPKP(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {9.98623,-36.4619}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAPKPP(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {69.8305,-35.572}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Substance MAP3KPP(initial_amount = 0) annotation(Placement(visible = true, transformation(origin = {32.4805,45.1613}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Reaction2to1BiAct reaction2to1biact2(k = 0.001, p = 0.00001) annotation(Placement(visible = true, transformation(origin = {0.00000417761,49.9037}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  MAPK.Components.Reaction2to1BiAct reaction2to1biact1(k = 0.001, p = 0.00001) annotation(Placement(visible = true, transformation(origin = {-57.9962,49.9036}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(MAPKPP.n,reaction2to1biact2.activator) annotation(Line(points = {{69.8305,-35.572},{77.0713,-35.572},{77.0713,29.4798},{-0.385356,29.4798},{-0.385356,39.499},{-0.385356,39.499}}));
  connect(reaction2to1biact3.product,MAP2KP.n) annotation(Line(points = {{-31.8112,3.46821},{-20.2312,3.46821},{-20.2312,3.85356},{-20.2312,3.85356}}));
  connect(MAP2KPP.n,reaction2to1biact6.activator) annotation(Line(points = {{44.0515,4.26871},{30.4432,4.26871},{30.4432,-16.9557},{-79.5761,-16.9557},{-79.5761,-55.2987},{41.4258,-55.2987},{41.4258,-47.0135},{41.4258,-47.0135}}));
  connect(MAP2KPP.n,reaction2to1biact5.activator) annotation(Line(points = {{44.0515,4.26871},{30.4432,4.26871},{30.4432,-16.9557},{-79.5761,-16.9557},{-79.5761,-55.2987},{-21.58,-55.2987},{-21.58,-46.6281},{-21.58,-46.6281}}));
  connect(ATP.n,reaction2to1biact5.reactant2) annotation(Line(points = {{85.1638,87.0906},{62.8131,87.0906},{62.6204,-21.0019},{-31.4066,-21.0019},{-31.4066,-31.6455},{-31.1946,-31.6455}}));
  connect(MAP4K.n,reaction2to1biact1.activator) annotation(Line(points = {{-86.8979,87.6686},{-96.7245,87.6686},{-96.7245,30.0578},{-58.5742,30.0578},{-58.5968,40.0963},{-58.5968,39.9036}}));
  connect(reaction2to1biact1.product,MAP3KP.n) annotation(Line(points = {{-47.9962,49.9036},{-31.2139,49.9036},{-31.2139,46.3321},{-29.5008,46.3321}}));
  connect(MAP3K.n,reaction2to1biact1.reactant1) annotation(Line(points = {{-84.5549,45.5112},{-68.5934,45.5112},{-67.9962,46.0963},{-67.9962,45.9036}}));
  connect(ATP.n,reaction2to1biact1.reactant2) annotation(Line(points = {{85.1638,87.0906},{-68.0154,87.0906},{-67.9962,54.0963},{-67.9962,53.9036}}));
  connect(MAP3KP.n,reaction2to1biact3.activator) annotation(Line(points = {{-29.5008,46.3321},{-55.2987,36.8909},{-55.2987,18.6898},{-94.4123,18.6898},{-94.4123,-13.8728},{-42.3892,-13.8728},{-42.3892,-6.53179},{-42.4119,-6.53179}}));
  connect(MAP3KP.n,reaction2to1biact4.activator) annotation(Line(points = {{-29.5008,46.3321},{-55.2987,36.8909},{-55.2987,18.6898},{-94.4123,18.6898},{-94.4123,-13.8728},{14.8362,-13.8728},{14.8362,-7.3025},{14.8136,-7.3025}}));
  connect(reaction2to1biact5.product,MAPKP.n) annotation(Line(points = {{-11.1946,-35.6455},{5.20231,-35.6455},{5.20231,-35.6455},{5.20231,-35.6455}}));
  connect(reaction2to1biact6.product,MAPKPP.n) annotation(Line(points = {{51.6185,-36.8015},{65.7033,-36.8015},{65.7033,-36.0308},{65.7033,-36.0308}}));
  connect(MAPKP.n,reaction2to1biact6.reactant1) annotation(Line(points = {{9.98623,-36.4619},{31.2139,-36.4619},{31.2139,-40.8478},{31.2139,-40.8478}}));
  connect(MAP1K.n,reaction2to1biact5.reactant1) annotation(Line(points = {{-52.4085,-34.104},{-31.0212,-34.104},{-31.0212,-39.3064},{-31.0212,-39.3064}}));
  connect(reaction2to1biact4.product,MAP2KPP.n) annotation(Line(points = {{25.4143,2.6975},{40.8478,2.6975},{40.8478,3.85356},{40.8478,3.85356}}));
  connect(MAP2KP.n,reaction2to1biact4.reactant1) annotation(Line(points = {{-12.9006,4.04624},{5.39499,4.04624},{5.39499,-1.15607},{5.39499,-1.15607}}));
  connect(MAP2K.n,reaction2to1biact3.reactant1) annotation(Line(points = {{-63.7765,3.85356},{-51.4451,3.85356},{-51.4451,-0.770713},{-51.4451,-0.770713}}));
  connect(MAP3KP.n,reaction2to1biact2.reactant1) annotation(Line(points = {{-29.5008,46.3321},{-9.24855,46.3321},{-9.24855,45.4721},{-9.24855,45.4721}}));
  connect(ATP.n,reaction2to1biact2.reactant2) annotation(Line(points = {{85.1638,87.0906},{-10.2119,87.0906},{-10.2119,53.1792},{-10.2119,53.1792}}));
  connect(reaction2to1biact2.product,MAP3KPP.n) annotation(Line(points = {{10,49.9037},{28.9017,49.9037},{28.9017,45.1613},{32.4805,45.1613}}));
  connect(ATP.n,reaction2to1biact6.reactant2) annotation(Line(points = {{85.1638,87.0906},{66.2813,87.0906},{66.2813,-22.736},{31.5992,-22.736},{31.5992,-32.7553},{31.5992,-32.7553}}));
  connect(ATP.n,reaction2to1biact4.reactant2) annotation(Line(points = {{85.1638,87.0906},{58.1888,87.0906},{58.1888,19.2678},{5.39499,19.2678},{5.39499,6.93642},{5.39499,6.93642}}));
  connect(ATP.n,reaction2to1biact3.reactant2) annotation(Line(points = {{85.1638,87.0906},{52.4085,87.0906},{52.4085,26.3969},{-51.8304,26.3969},{-51.8304,7.89981},{-51.8304,7.89981}}));
equation
  //input signal varies with time
  /*if 1 < time and time < 2 then
    MAP4K.n.rate = 10000;
  else
    MAP4K.n.rate = 0;
  end if;*/
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
end ComponentModel;


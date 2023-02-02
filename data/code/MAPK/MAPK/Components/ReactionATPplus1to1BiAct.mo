within MAPK.Components;
model ReactionATPplus1to1BiAct "Bidirectional reaction with ATP and one other reactant, one product and an activator substance"
  parameter Real k = 0.001 "Forward reaction constant";
  parameter Real p = 1 "Backward reaction constant";
  parameter Real ATP = 1;
  SubstanceAmount activator "Activator substance for reaction" annotation(Placement(visible = true, transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {2.11946,-99.8073}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  SubstanceAmount reactant "Reactant 2" annotation(Placement(visible = true, transformation(origin = {-100,-40}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,4.70135}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  SubstanceAmount product "Product of reaction" annotation(Placement(visible = true, transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,5.97303}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  product.rate = -1 * (k * reactant.amount * ATP * activator.amount - p * product.amount);
  reactant.rate = -1 * (-k * reactant.amount * ATP * activator.amount + p * product.amount);
  activator.rate = 0;
  //Activator is not consumed
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {-13.2948,5.58767}, points = {{-51.2524,4.23892},{71.4836,4.23892}}, thickness = 5, arrow = {Arrow.None,Arrow.Filled}, arrowSize = 5),Line(origin = {6.12717,-1.57996}, rotation = 180, points = {{-51.2524,4.23892},{71.4836,4.23892}}, thickness = 5, arrow = {Arrow.None,Arrow.Filled}, arrowSize = 5),Line(origin = {-2.79573,23.5166}, points = {{-49.8054,14.8264},{-37.6667,0.182865},{-17.8208,-9.8364},{7.80536,-10.7998},{25.7244,-4.24873},{42.1021,16.5605}}, thickness = 5, arrow = {Arrow.None,Arrow.Filled}, arrowSize = 5, smooth = Smooth.Bezier),Text(origin = {-88.5357,65.896}, extent = {{-20.3276,-3.27556},{97.2062,-25.0482}}, textString = "ATP (%ATP)"),Text(origin = {52.6975,57.1291}, extent = {{-19.3642,7.99615},{46.5318,-15.1252}}, textString = "ADP"),Ellipse(origin = {-0.0963392,-51.7341}, fillColor = {255,85,0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-9.34489,13.9692},{9.34489,-13.9692}}, endAngle = 360),Ellipse(origin = {-0.289017,-48.0732}, fillColor = {255,170,0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-5.10597,16.6667},{5.10597,-16.6667}}, endAngle = 360),Rectangle(origin = {0.770713,-67.9191}, fillPattern = FillPattern.Solid, extent = {{-25.2408,6.26204},{25.2408,-6.26204}})}));
end ReactionATPplus1to1BiAct;


within MAPK.Components;
model JumpSignal
  parameter Real tjump = 1;
  parameter Real level = 10000;
  SubstanceAmount subst annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-90,-90},{90,90}}, rotation = 0), iconTransformation(origin = {100.05,46.3348}, extent = {{-21.8632,-21.8632},{21.8632,21.8632}}, rotation = 0)));
equation
  //input signal varies with time
  if time > tjump then
    subst.amount = level;
  else
    subst.amount = 0;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {-47.7036,-48.0374}, points = {{-25.4888,-17.8136},{-7.19067,-17.8137},{-7.13508,95.2007},{135.357,95.4226}}, thickness = 5),Text(origin = {-94.5495,-54.6163}, extent = {{-9.34371,9.67742},{22.6919,-29.4772}}, textString = "0"),Text(origin = {-54.6163,-80.2002}, extent = {{-21.4683,8.12013},{39.7108,-18.5762}}, textString = "t=%tjump"),Text(origin = {-17.575,67.6307}, extent = {{-48.9433,26.6963},{76.9744,-15.5729}}, textString = "%level", horizontalAlignment = TextAlignment.Left)}));
end JumpSignal;


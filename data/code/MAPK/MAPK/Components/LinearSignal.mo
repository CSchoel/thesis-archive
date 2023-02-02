within MAPK.Components;
model LinearSignal
  parameter Real crate = 0.5;
  parameter Real tstart = 1;
  parameter Real tstop = 2;
  parameter Real m = 10000;
  SubstanceAmount subst annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-90,-90},{90,90}}, rotation = 0), iconTransformation(origin = {100.05,55.4561}, extent = {{-21.8632,-21.8632},{21.8632,21.8632}}, rotation = 0)));
equation
  //input signal varies with time
  if tstart < time and time < tstop then
    subst.rate = -m;
  else
    subst.rate = 0;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {-48.5935,-47.8149}, points = {{-39.9493,-17.5911},{-6.02273,-17.5913},{56.3799,103.432},{138.471,103.432}}, thickness = 5),Text(origin = {-92.7697,-67.5195}, extent = {{-9.34371,9.67742},{4.67186,-5.4505}}, textString = "0"),Text(origin = {-3.22581,-12.792}, extent = {{-20.5784,8.56507},{63.2925,-21.0234}}, textString = "der(x) = %m"),Text(origin = {-50.8343,-75.9733}, extent = {{-21.4683,8.12013},{39.7108,-18.5762}}, textString = "%tstart"),Text(origin = {9.4327,68.3871}, extent = {{-28.8098,9.67742},{31.7019,-9.01001}}, textString = "%tstop")}));
end LinearSignal;


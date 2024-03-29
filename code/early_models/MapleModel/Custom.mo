/* Generated by MapleSim (www.maplesoft.com) - 16:27:55 09-01-2014 */
model Main
   import Modelica.Constants.inf;
   import Pi=Modelica.Constants.pi;
   import pi=Modelica.Constants.pi;

   public VeryCustom VeryCustom1(K=1000, B=10) annotation(Placement(transformation(origin={140.0,370.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
   annotation(
         Diagram(coordinateSystem(preserveAspectRatio=true, extent={{0,0},{500.0,500.0}}),graphics),
         Icon(coordinateSystem(preserveAspectRatio=true, extent={{0,0},{200.0,200.0}}),graphics={Rectangle(extent={{0,0},{200.0,200.0}}, lineColor={0,0,0})}),
         uses(Modelica(version="3.1")),
         experiment(
           StartTime = 0,
           StopTime = 10.0,
           __Maplesoft_solver = "ck45",
           __Maplesoft_adaptive = true,
           __Maplesoft_engine = 2,
           Tolerance = 0.10e-4,
           __Maplesoft_tolerance_abs = 0.10e-4,
           __Maplesoft_step_size = 0.10e-2,
           __Maplesoft_plot_points = 200,
           __Maplesoft_numeric_jacobian = false,
           __Maplesoft_constraint_iterations = 50,
           __Maplesoft_event_iterations = 100,
           __Maplesoft_algebraic_error_relaxation_factor = 1.0,
           __Maplesoft_rate_hysteresis = 0.10e-9,
           __Maplesoft_scale_method = "none",
           __Maplesoft_reduce_events = false,
           __Maplesoft_plot_event_points = true,
           __Maplesoft_compiler = true,
           __Maplesoft_compiler_optimize = true
         )
   );
end Main;
model VeryCustom
    extends Maplesoft.Icons.CustomComponent;
    parameter Real K = 1000 "K";
    parameter Real B = 10 "B";
    Real Fa;
    Real Fb;
    Real d;
    Real dt;
    Real s;
    Real sat;
    Real sb;
    Modelica.Blocks.Interfaces.RealInput inp0 annotation (Placement(transformation(
        extent = {
            {-110, -10}, 
            {-90, 10}},
        rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput out annotation (Placement(transformation(
        extent = {
            {90, -10}, 
            {110, 10}},
        rotation = 0)));
equation
    0 = Fa + Fb;
    Fa = if s < 0 then K * s + B * d / dt * s else 0;
    s = sat - sb;
    inp0 = 10;
    out = 10;
    annotation (uses(Modelica(version = "3.1")));
end VeryCustom;


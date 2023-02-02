/* Generated by MapleSim (www.maplesoft.com) - 16:18:15 09-01-2014 */
model Main
   import Modelica.Constants.inf;
   import Pi=Modelica.Constants.pi;
   import pi=Modelica.Constants.pi;

   public Modelica.Electrical.Analog.Basic.Ground G1 annotation(Placement(transformation(origin={220.0,180.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
   public Modelica.Electrical.Analog.Basic.Capacitor C1(C=1000000^(-1)*200) annotation(Placement(transformation(origin={500.0,260.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
   public Modelica.Electrical.Analog.Basic.Inductor I1(L=1000^(-1)*160) annotation(Placement(transformation(origin={360.0,330.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
   public Modelica.Electrical.Analog.Basic.Resistor R1(R=24, T_ref=300.15, alpha=0, useHeatPort=false, T=R1.T_ref) annotation(Placement(transformation(origin={230.0,330.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
   public Modelica.Electrical.Analog.Sources.SignalVoltage SV1 annotation(Placement(transformation(origin={120.0,280.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
   public Modelica.Blocks.Sources.Step S1(height=1, offset=0, startTime=.1) annotation(Placement(transformation(origin={80.0,150.0},extent={{-20.0,-20.0},{20.0,20.0}},rotation=0)));
equation
   connect(SV1.v, S1.y) annotation(Line(points={{120.0,294.0},{120.0,150.0},{102.0,150.0}},color={0,0,127},smooth=Smooth.None));
   connect(SV1.p, R1.p) annotation(Line(points={{100.0,280.0},{90.0,280.0},{90.0,330.0},{210.0,330.0}},color={0,0,255},smooth=Smooth.None));
   connect(SV1.n, G1.p) annotation(Line(points={{140.0,280.0},{220.0,280.0},{220.0,200.0}},color={0,0,255},smooth=Smooth.None));
   connect(R1.n, I1.p) annotation(Line(points={{250.0,330.0},{340.0,330.0}},color={0,0,255},smooth=Smooth.None));
   connect(I1.n, C1.p) annotation(Line(points={{380.0,330.0},{430.0,330.0},{430.0,260.0},{480.0,260.0}},color={0,0,255},smooth=Smooth.None));
   connect(C1.n, G1.p) annotation(Line(points={{520.0,260.0},{530.0,260.0},{530.0,200.0},{220.0,200.0}},color={0,0,255},smooth=Smooth.None));
   annotation(
         Diagram(coordinateSystem(preserveAspectRatio=true, extent={{0,0},{500.0,500.0}}),graphics),
         Icon(coordinateSystem(preserveAspectRatio=true, extent={{0,0},{200.0,200.0}}),graphics={Rectangle(extent={{0,0},{200.0,200.0}}, lineColor={0,0,0})}),
         uses(Modelica(version="3.1")),
         experiment(
           StartTime = 0,
           StopTime = .5,
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
         ),
         __Maplesoft_probes={
         	Probe(name="Probe1", quantities={Quantity(variable=I1.n.v, endPin=C1.p.v, displayName="v")})
         }
   );
end Main;


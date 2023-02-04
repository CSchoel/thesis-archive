within SawtoothTest;
model SignalInstance

  Signal sig annotation (Placement(transformation(extent={{-12,-8},{8,12}}),
        iconTransformation(extent={{-100,-100},{100,100}})));
equation
  der(sig.n) = sig.rate;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Text(
          extent={{-100,100},{-20,12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="I"),
        Text(
          extent={{10,100},{90,12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="I"),
        Text(
          extent={{-100,-14},{-20,-102}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="I"),
        Text(
          extent={{12,-18},{92,-106}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="I")}));
end SignalInstance;

within SawtoothTest;
connector Signal
  Real n;
  Real rate;
  //Comment, yay
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Ellipse(
          extent={{-88,18},{-48,-22}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-62,12},{56,-16}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{42,18},{82,-22}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={-4,58},
          rotation=90),
        Rectangle(
          extent={{-59,14},{59,-14}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={-5,-6},
          rotation=90),
        Ellipse(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={-4,-70},
          rotation=90)}));
end Signal;

within MAPK.Basic;
model DirectModel
  Real MAP4K(start = 0);
  Real MAP3K(start = 10000);
  Real MAP3KP(start = 0);
  Real MAP3KPP(start = 0);
  Real MAP2K(start = 10000);
  Real MAP2KP(start = 0);
  Real MAP2KPP(start = 0);
  Real MAPK(start = 10000);
  Real MAPKP(start = 0);
  Real MAPKPP(start = 0);
  parameter Real ATP = 1;
  parameter Real k1 = 0.001;
  parameter Real k2 = 0.001 * 1000;
  parameter Real k3 = 0.001;
  parameter Real k4 = 0.001;
  parameter Real k5 = 0.1;
  parameter Real k6 = 0.1;
  parameter Real p1 = 0.00001;
  parameter Real p2 = 0.00001;
  parameter Real p3 = 1;
  parameter Real p4 = 1;
  parameter Real p5 = 1;
  parameter Real p6 = 1;
  parameter Real k2fb = 1;
  parameter Boolean feedback = false;
equation
  //input signal varies with time
  if 1 < time and time < 2 then
    der(MAP4K) = 10000;
  else
    der(MAP4K) = 0;
  end if;
  der(MAP3K) = -k1 * MAP3K * MAP4K * ATP + p1 * MAP3KP;
  //determine influence of MAPK on k2
  if feedback then
    der(MAP3KP) = k1 * MAP3K * MAP4K * ATP - p1 * MAP3KP - k2 * MAP3KP * ATP + p2 * MAP3KPP - k2fb * MAPKPP * MAP3KP * ATP;
    der(MAP3KPP) = k2 * MAP3KP * ATP - p2 * MAP3KPP + k2fb * MAPKPP * MAP3KP * ATP;
  else
    der(MAP3KP) = k1 * MAP3K * MAP4K * ATP - p1 * MAP3KP - k2 * MAP3KP * ATP + p2 * MAP3KPP;
    der(MAP3KPP) = k2 * MAP3KP * ATP - p2 * MAP3KPP;
  end if;
  der(MAP2K) = -k3 * MAP2K * MAP3KP * ATP + p3 * MAP2KP;
  der(MAP2KP) = k3 * MAP2K * MAP3KP * ATP - p3 * MAP2KP - k4 * MAP2KP * MAP3KP * ATP + p4 * MAP2KPP;
  der(MAP2KPP) = k4 * MAP2KP * MAP3KP * ATP - p4 * MAP2KPP;
  der(MAPK) = -k5 * MAPK * MAP2KPP * ATP + p5 * MAPKP;
  der(MAPKP) = k5 * MAPK * MAP2KPP * ATP - p5 * MAPKP - k6 * MAPKP * MAP2KPP * ATP + p6 * MAPKPP;
  der(MAPKPP) = k6 * MAPKP * MAP2KPP * ATP - p6 * MAPKPP;
end DirectModel;


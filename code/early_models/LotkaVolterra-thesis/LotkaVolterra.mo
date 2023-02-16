model LotkaVolterra "simple predator-prey model"
  Real N1 "size of predator population";
  Real N2 "size of prey population";
  parameter Real beta1 = 0.1 "birth rate of prey";
  parameter Real beta2 = 0.02 "birth rate of predator";
  parameter Real delta1 = 0.02 "death rate of prey";
  parameter Real delta2 = 0.4 "death rate of predator";
equation
  der(N1) = beta1 * N1 - delta1 * N2 * N1;
  der(N2) = beta2 * N1 * N2 - delta2 * N2;
initial equation
  N1 = 10;
  N2 = 10;
end LotkaVolterra;
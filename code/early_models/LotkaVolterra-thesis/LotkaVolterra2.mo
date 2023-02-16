model LotkaVolterra2 "simple predator-prey model"
  type PopulationSize = Real(unit="1", quantity="PopulationSize", min=0)
    "population size in numbers of individuals";
  type GrowthRate = Real(unit="1/s", quantity="GrowthRate", min=0)
    "exponential growth rate of population";
  type FractionalGrowthRate = Real(unit="1/s", quantity="FractionalGrowthRate", min=0)
    "fraction of growth rate contributed per individual of second population";

  constant Real secondsPerYear(unit="s/y") = 60 * 60 * 24 * 365;

  PopulationSize pred(start=10000, fixed=true) "size of predator population";
  PopulationSize prey(start=10000, fixed=true) "size of prey population";
  Real time_years(unit="y", quantity="Time_years") = time / secondsPerYear
    "simulation time in years";

  parameter GrowthRate birth_prey = 0.1 / secondsPerYear "birth rate of prey";
  parameter FractionalGrowthRate birth_pred = 0.00002 / secondsPerYear
    "birth rate of predator by prey";
  parameter FractionalGrowthRate death_prey = 0.00002 / secondsPerYear
    "death rate of prey by predator";
  parameter GrowthRate death_pred = 0.4 / secondsPerYear "death rate of predator";
equation
  der(pred) = birth_prey * pred - death_prey * pred * prey;
  der(prey) = birth_pred * prey * pred - death_pred * prey;
annotation(experiment(
  StopTime = 3153600000, // 100 years
  Interval = 3153600     // 1/10 year
));
end LotkaVolterra2;
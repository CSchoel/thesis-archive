package LVUnits
  type PopulationSize = Real(unit="1", quantity="PopulationSize", min=0)
    "population size in numbers of individuals";

  type PopulationRate = Real(unit="1/s", quantity="PopulationRate")
    "change in population size as individuals per second";

  type GrowthRate = Real(unit="1/s", quantity="GrowthRate", min=0)
    "exponential growth rate of population";

  type FractionalGrowthRate = Real(
      unit="1/s", quantity="FractionalGrowthRate", min=0
    ) "fraction of growth rate contributed per individual of second population";

  constant Real secondsInYear(unit="s/y") = 60 * 60 * 24 * 365;

  function from_perYear "unit transformation from 1/y to 1/s"
    input Real py(unit="1/y");
    output Real ps(unit="1/s");
  algorithm
    ps := py / secondsInYear;
  end from_perYear;
end LVUnits;
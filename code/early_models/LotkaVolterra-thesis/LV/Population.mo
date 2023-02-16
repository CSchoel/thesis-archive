model Population "population of a species"
  Species species(start=initial_size, fixed=true);
  parameter LVUnits.PopulationSize initial_size = 10000 "initial population size";
equation
  der(species.amount) = -species.rate;
end Population;
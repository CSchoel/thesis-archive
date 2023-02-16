model LV3
  Population hares;
  Population lynxes;
  Population wolves;
  FixedBirth hare_birth;
  FixedDeath wolf_death;
  Predation lynxes_eat_hares;
  Predation wolves_eat_hares;
  Predation wolves_eat_lynxes;
  Real time_years(unit="y") = time / LVUnits.seconsInYear "time in years";
equation
  // Hares have always enough food to reproduce at fixed rate
  connect(hare_birth.born, hares.species);
  // Lynxes eat hares
  connect(lynxes_eat_hares.prey, hares.species);
  connect(lynxes_eat_hares.predator, lynxes.species);
  // Wolves eat hares
  connect(wolves_eat_hares.prey, hares.species);
  connect(wolves_eat_hares.predator, wolves.species);
  // Wolves eat lynxes
  connect(wolves_eat_lynxes.prey, lynxes.species);
  connect(wolves_eat_lynxes.predator, wolves.species);
  // Wolves die at a fixed rate independent of other populations
  connect(wolves.species, wolf_death.dying);
end LV3;
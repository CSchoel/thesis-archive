model Predation
  Species predator;
  Species prey;
  parameter LVUnits.FractionalGrowthRate birth_rate = LVUnits.from_perYear(0.0002);
  parameter LVUnits.FractionalGrowthRate death_rate = LVUnits.from_perYear(0.0002);
equation
  predator.rate = birth_rate * prey.amount * predator.amount;
  prey.rate = -death_rate * predator.amount * prey.amount;
end Predation;
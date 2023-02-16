model FixedDeath
  Species dying;
  parameter LVUnits.GrowthRate death_rate = LVUnits.from_perYear(0.1);
equation
  dying.rate = -death_rate * dying.amount;
end FixedDeath;
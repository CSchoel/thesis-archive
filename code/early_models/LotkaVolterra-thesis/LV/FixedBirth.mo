model FixedBirth
  Species born;
  parameter LVUnits.GrowthRate birth_rate = LVUnits.from_perYear(0.1);
equation
  born.rate = birth_rate * born.amount;
end FixedBirth;
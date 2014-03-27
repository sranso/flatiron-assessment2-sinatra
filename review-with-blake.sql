CREATE TABLE wizards (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  name TEXT
  age INT
  power_id1 INT
  power_id2 INT
);

-- three tables:
-- wizards (id name age)
-- wizard_power (wizard_id power_id)
-- powers (id name damage)
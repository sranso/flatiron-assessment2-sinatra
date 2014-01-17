-- version one
CREATE TABLE wizards (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  name TEXT
  age INT
  power_id1 INT
  power_id2 INT
);

CREATE TABLE powers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  name TEXT
  damage INT
);

INSERT INTO wizards(name, age, power_id1, power_id2)
VALUES ("gandy", 133, 1, 2), ("slava", 22, 3, 4)

INSERT INTO powers(name, damage)
VALUES ("tallest", 10), ("beardiest", 99), ("hottest", 92), ("slickest", 1)

-- version two
CREATE TABLE wizards (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  name TEXT
  age INT
  powername1 TEXT
  powerdamage1 INT
  powername2 TEXT
  powerdamage2 INT
);

INSERT INTO wizards(name, age, powername1, powerdamage1, powername2, powerdamage2)
VALUES ("gandy", 133, "tallest", 10, "beardiest", 99), ("slava", 22, "hottest", 92, "slickest", 1)

-- Create a data model for wizards for a world where wizards have many powers and 
-- multiple wizards can have the same power. Create some sample records.
CREATE TABLE wizards (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  name TEXT
  age INT
);

CREATE TABLE powers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
  name TEXT
  damage INT
);

INSERT INTO wizards(name, age)
VALUES ("gandy", 133, 1, 2), ("slava", 22, 3, 4)

INSERT INTO powers(name, damage)
VALUES ("tallest", 10), ("beardiest", 99), ("hottest", 92), ("slickest", 1)


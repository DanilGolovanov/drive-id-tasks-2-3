-- create
CREATE TABLE Brokers (
  id INTEGER NOT NULL,
  name TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Customers (
	id INTEGER NOT NULL, 
	name TEXT NOT NULL, 
	amount INTEGER,
	broker_id INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (broker_id) REFERENCES Broker(id)
);

-- insert
INSERT INTO Brokers (id, name) values (1, 'Ted');
INSERT INTO Brokers (id, name) values (2, 'Mark');
INSERT INTO Brokers (id, name) values (3, 'Aaron');
INSERT INTO Brokers (id, name) values (4, 'Luke');

INSERT INTO Customers (id, name, amount, broker_id) values (1, 'sam', 3000, 4);
INSERT INTO Customers (id, name, amount, broker_id) values (2, 'john', 4000, 2);
INSERT INTO Customers (id, name, amount, broker_id) values (3, 'mack', 5000, 4);
INSERT INTO Customers (id, name, amount, broker_id) values (4, 'test', 3000, 3);
INSERT INTO Customers (id, name, amount, broker_id) values (5, 'june', 2000, 3);
INSERT INTO Customers (id, name, amount, broker_id) values (6, 'mike', 4000, 1);
INSERT INTO Customers (id, name, amount, broker_id) values (7, 'annie', 4000, 2);
INSERT INTO Customers (id, name, amount, broker_id) values (8, 'micheal', 2000, 1);
INSERT INTO Customers (id, name, amount, broker_id) values (9, 'tom', 2000, 4);
INSERT INTO Customers (id, name, amount, broker_id) values (10, 'jason', 6000, 4);

-- fetch 
SELECT b.name, COUNT(c.id)
FROM Customers c 
JOIN Brokers b ON (c.broker_id = b.id)
GROUP BY b.id
ORDER BY COUNT(c.id) DESC, b.name;
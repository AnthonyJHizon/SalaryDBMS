-- Script name: inserts.sql
-- Author:      Anthony Joshua Hizon
-- Purpose:     insert sample data to test the integrity of this database system
   
-- the database used to insert the data into.
USE `jVJJMgOQhb`;

-- 4. Address

INSERT INTO Address (zipcode, city, street, state)
VALUES ("11111", "San Francisco", "1st Street", "CA"),
("22222", "Seattle", "3rd Street", "WA"),
("33333", "New Hyde Park"," 589 Buell Street", "NY"),
("11111", "San Francisco", "4th Street", "CA"),
("22222", "Seattle", "5TH Street", "WA"),
("33333", "San Philipe Street", "2nd Street", "NY"),
("11111", "San Diego", "801 Moose Road", "CA"),
("22222", "Los Angeles", "8 Northview Pass", "WA"),
("33333", "Syracuse", "41276 Gateway Pass", "NY"),
("11111","Petaluma", "00390 Grover Park", "CA"),
("22222", "Santa Ana", "6 Farwell Circle", "WA"),
("33333","New York City", "3933 West Way", "NY"),
("11111", "Seattle", "62579 Jackson Hill", "CA"),
("22222", "Long Beach", "222 Del Sol Street", "WA"),
("33333", "Brooklyn", "7 East Junction", "NY");

 -- 2. Business

INSERT INTO Business (name, description, address)
VALUES ("Costco", "BUY IN BULK", 1),
("Subway", "Eat Fresh", 2),
("Popeyes", NULL, 3),
("Costco 2", NULL, 4);

 -- 1. Owner

INSERT INTO Owner (name, email, number, business)
VALUES ("Charles Brown", "charlesbrown@email.com", "14154154150", 1),
("Charlie Brown", "charliebrown@email.com", "14154154151", 1),
("Joe Smith", "joesmith@email.com", "13243243240", 2),
("Steve Stevenson", "stevestevenson@email.com", "19998887777", 3),
("Steve", "steven@email.com", "19932417777", 4);



-- 3. Employee

INSERT INTO Employee (name, email, number, business)
VALUES ("Bob the Builder", "bobbuilder@email.com", "11111111111", 1),
("Jeff the Builder", "jeffbuilder@email.com", "11111111112", 1),
("Gordon Ramsay", "gordan@email.com", "22222222222", 2),
("Stephen Cook", "stephen@email.com", "33333333333", 3),
("Bob", "bob@email.com", "33333333331", 1),
("Dan", "dan@email.com", "33333333332", 2),
("Edd", "edd@email.com", "33333333334", 3),
("Vale Carress", "vcarress0@live.com", 17928304132, 1),
("Elke Righy", "erighy1@paypal.com", 29642799681, 2),
("Farlay Leebetter", "fleebetter2@ihg.com", 38884353502, 3),
("Even Davydoch", "edavydoch3@prweb.com", 15351169411, 1),
("Daffie Cobbledick", "dcobbledick4@163.com", 25888592546, 2),
("Renie Bearne", "rbearne5@google.de", 38316247765, 3),
("Elsie Wolfenden", "ewolfenden6@cafepress.com", 12265348011, 1),
("Jephthah Kinnerk", "jkinnerk7@fema.gov", 25311897211, 2),
("Timothee Levi", "tlevi8@spotify.com", 36968126634, 3),
("Micki Murfill", "mmurfill9@com.com", 13589643519, 1),
("Ag Blei", "ableia@springer.com", 22737794603, 2),
("Josselyn Baskett", "jbaskettb@oracle.com", 35756098228, 3),
("Courtney Punter", "cpunterc@histats.com", 18289625344, 1),
("Flem Di Filippo", "fdid@smh.com.au", 23713334994, 2),
("Bourke Brandino", "bbrandinoe@statcounter.com", 35677591854, 3),
("Dorisa Alsford", "dalsfordf@vistaprint.com", 14105531816, 1),
("Sandie Overstone", "soverstoneg@va.gov", 25718481421, 2),
("Hirsch Rutherford", "hrutherfordh@rambler.ru", 39233531479, 3),
("Allan Shilstone", "ashilstonei@economist.com", 12696246680, 1),
("Coretta Loosemore", "cloosemorej@unicef.org", 22084104102, 2),
("Henderson Derry", "hderryk@feedburner.com", 34865584083, 3),
("Masha Milward", "mmilwardl@guardian.co.uk", 17269258604, 1),
("Jessamyn Ielden", "jieldenm@wikia.com", 27334257037, 2),
("Gilly Giabuzzi", "ggiabuzzin@linkedin.com", 34097121366, 3),
("Billy", "billy@linkedin.com", 34397121366, 4);


-- 5. Employee Address

INSERT INTO `Employee Address` (employee, address)
VALUES (1, 4), (2,4), (3,5), (4,6), (5,7), (6,8), (7,9), (8,10),
(9, 11), (10, 12), (11, 13), (12, 14), (13, 15), (14,4), (15,5),
(16,6), (17,7), (18, 8), (19, 9), (20,10), (21,11), (22,12), (23,13),
(24,14), (25,15), (26,4), (27,5), (28,6), (29,7), (30,8), (31,4);

-- 6. Bank Account

INSERT INTO `Bank Account` (bank_name, bank_number, routing_number)
VALUES ("Chase", "1111111111111", "111111111"),
("Wells Fargo", "1111111111112", "111111112"),
("Chase", "1111111111113", "111111113"),
("Chase", "2111111111111", "211111111"),
("Wells Fargo", "3111111111111", "311111111"),
("Chase", "4111111111111", "411111111"),
("Wells Fargo", "5111111111111", "511111111"),
("Mosciski, Fahey and Prosacco", 2819839642715, 117817734),
("Nicolas Inc", 6909600201247, 692909284),
("Kuphal Inc", 7587385542555, 124073976),
("Goldner, Homenick and Pouros", 8575845812797, 753235147),
("Schimmel-Stamm", 5430226852087, 131128983),
("Orn-Weissnat", 4859677918347, 938617027),
("Keeling, Brakus and Reynolds", 6609987402593, 160917198),
("Lueilwitz, Price and Hyatt", 9953925552469, 355805268),
("Deckow, Daugherty and Beahan", 6200233704585,909081020),
("Stroman, Metz and Metz", 3036231607535, 444839561),
("Carter LLC", 3056179848840, 844007666),
("Weber and Sons", 1151981762557, 647507775),
("Ernser Quitzon and Sawayn", 9249879265611, 501495339),
("O'Conner Gerhold and Johnson", 9280675734681, 826899743),
("Sanford Inc", 9404446970513, 601845419),
("Witting Inc", 1990057513900, 410684956),
("Bauch, Bayer and Bartell", 1770564896194, 380311215),
("Legros, Feil and O'Kon", 7234752948234, 317457703),
("Kohler-Klocko", 7028820026968, 751690259),
("Goodwin-McKenzie", 6301208810261, 420731159),
("Hodkiewicz-Gutmann", 5543572601923, 852250572),
("Johnston Group", 4351770434914, 348555014),
("Mraz-Kuhlman", 6730102599282, 308131229),
("McClure, Rempel and Pouros", 4734436643809, 792196453),
("Simonis and Sons", 4935029364359, 694623430),
("Kovacek, Muller and Borer", 2255053996358, 371909232),
("Bechtelar-Mitchell", 9664068050202, 281422005),
("Bechtelar-Mitchell", 9664068050203, 381422006),
("Business 4", 9674068050102, 285422006);

-- 7. Business Bank Account

INSERT INTO `Business Bank Account` (business, bank_account)
VALUES (1, 1), (2,2), (3,3), (4,34);

-- 8. Employee Bank Account

INSERT INTO `Employee Bank Account` (employee, bank_account)
VALUES (1, 4), (2,5), (3,6), (4, 7), (5,8), (6,9), (7,10), (8,11),
(9,12), (10,13), (11,14), (12,15), (13,16), (14,17), (15,18), (16,19),
(17,20), (18,21), (19,22), (20,23), (21,24), (22,25), (23,26), (24,27),
(25,28), (26,29), (27,30), (28,31), (29,32), (30,33);

-- 9. Employee Account

INSERT INTO `Employee Account` (created, employee)
VALUES (NOW(), 1), (NOW(), 2), (NOW(), 3), (NOW(), 4),
(NOW(), 5), (NOW(), 6), (NOW(), 7), (NOW(), 8),
(NOW(), 9), (NOW(), 10), (NOW(), 11), (NOW(), 12),
(NOW(), 13), (NOW(), 14), (NOW(), 15), (NOW(), 16),
(NOW(), 17), (NOW(), 18), (NOW(), 19), (NOW(), 20),
(NOW(), 21), (NOW(), 22), (NOW(), 23), (NOW(), 24),
(NOW(), 25), (NOW(), 26), (NOW(), 27), (NOW(), 28),
(NOW(), 29), (NOW(), 30), (NOW(), 31);

-- 10. Schedule

INSERT INTO Schedule (days, time)
VALUES ("MTW", "12:00-20:00"),
("RFS", "8:00-16:00"),
("RFS", "12:00-20:00"),
("MTW", "8:00-16:00"),
("MTW", "18:00-24:00"),
("RFSU", "7:00-22:00"),
("RFSU", "14:00-22:00");

-- 11. Employee Schedule

INSERT INTO `Employee Schedule` (employee, schedule)
VALUES(1,1), (1,2), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7),
(8,1), (9,2), (10,2), (11,3), (12,4), (13,5), (14,6), (15,7),
(16,1), (17,2), (8,2), (19,3), (20,4), (21,5), (22,6), (23,7),
(24,1), (25,2), (26,2), (27,3), (28,4), (29,5), (30,6), (31,1);

-- 12. Position

INSERT INTO Position (name, description)
VALUES ("Security Guard", "Protects the entrance"),
("Cook", "Cooks food"),
("Janitor", "Cleans"),
("Builder", "Mantains shop"),
("Cashier", "Store Cashier"),
("Waiter", "Waiter for restaurant"),
("Inventory", "Unloads and places inventory"),
("Entertainer", "Entertains Guests"),
("Accountant", "Keeps track of finances"),
("Standard Worker", "Works Standardly");

-- 13. Employee Position

INSERT INTO `Employee Position` (employee, position)
VALUES (1,4), (2,4), (3,3), (4,1), (5,1), (5,3), (6,2), (7,5), (8,10),
(9,6), (9,7), (10,8), (10,9), (11,1), (11,10), (12,3), (13,4), (13,5),
(14,6), (14,1), (15,10), (15,6), (16,7), (17,4), (18,3), (19,9), (20,7),
(21,4), (21,9), (22,10), (23,6), (24,7), (25,8), (26,9), (27,6), (28,9), (29,10),
(30,8), (30,9), (30,7), (31,1);

-- 14. Benefit

INSERT INTO Benefit (name, insurance_type, description)
VALUES ("Eye Care", "Medical", "Reduce prices for glasses"),
("Dental Care", "Medical", "Reduce prices for dental trips"),
("Disability Benefit", "Disability", "Compensation if injured during the job"),
("Life Insurance", "Life", "Life insurance incase you die");

-- 15. Employee Benefit

INSERT INTO `Employee Benefit` (employee, benefit)
VALUES (1,1),(1,2),(1,3),(2,1),(2,3),(3,4),(4,4),(4,1),
(5,1),(7,1),(7,2),(7,3),(10,1),(12,1),(12,4),(13,1),(17,1),
(17,3),(20,4),(20,3),(25,1),(25,2),(26,2),(27,3),(28,4),(30,1),
(30,1),(30,2),(30,3),(30,4);

-- 16. Wage

INSERT INTO Wage (amount, created)
VALUES(16.50, NOW()), (15.00, NOW()), (100.12, NOW()), (1.01, NOW());

-- 17. Employee Wage

INSERT INTO `Employee Wage` (employee, wage)
VALUES (1,1), (2,2), (3,3), (4,4);

-- 18. Payment

INSERT INTO Payment (created, amount, description)
VALUES (NOW(), 2000, "Weekly Payment"),
(NOW(), 100000, "Annual Payment"),
(NOW(), 10000, "Monthly Payment"),
(NOW(), 100, "Daily Payment"),
(NOW(), 200, "Daily Payment"),
(NOW(), 300, "Daily Payment");

-- 19. Direct Deposit

INSERT INTO `Direct Deposit` (payment_id, bank_name, bank_account_number, routing_number)
VALUES (1,"Chase", "1111111111113", "111111113"),
(2,",Chase", "2111111111111", "211111111"),
(3,"Wells Fargo", "3111111111111", "311111111");

-- 20. Check

INSERT INTO `Check` (payment_id, memo, routing_number, check_number)
VALUES (4 ,"Payment for 10/31/21", "411111111", "1234"),
(5 ,"Payment for 10/30/21", "411111111", "1235"),
(6 ,"Payment for 10/29/21", "411111111", "1236");


-- 21. Payment To Employee

INSERT INTO `Payment To Employee` (employee, payment)
VALUES (1,1),(2,2),(3,3),(4,4),(4,5),(4,6);

-- 22. Business Payment

INSERT INTO `Business Payment` (business, payment)
VALUES (1,1),(1,2),(2,3),(3,4),(3,5),(3,6);

-- 23. Reimbursement

INSERT INTO Reimbursement (description, amount, created)
VALUES ("Reimbursement for hammer purchase", 16, '2017-02-20 14:15:34'),
("Reimbursement for ingredient purchase", 10, '2016-02-20 14:15:34'),
("Reimbursement for chicken purchases", 20, '2015-02-20 14:15:34'),
("Reimbursement for appliances", 100.24, '2014-02-20 14:15:34'),
("Reimbursement for food", 1123.27, '2013-02-20 14:15:34'),
("Reimbursement for tools", 999.23, '2012-02-20 14:15:34'),
("Reimbursement for laptop", 1021.98, '2011-02-20 14:15:34'),
("Reimbursement for computer", 4324.24, '2010-02-20 14:15:34'),
("Reimbursement for mouse", 15.99, '2019-02-20 14:15:34'),
("Reimbursement for keyboard", 19.99, '2018-02-20 14:15:34'),
("Reimbursement for lantern", 2031.23, '2017-02-20 14:15:34'),
("Reimbursement for chandelier", 9239.76, '2010-02-20 14:15:34'),
("Reimbursement for iphone", 520.21, '2016-02-20 14:15:34'),
("Reimbursement for parking", 1000.97, '2015-02-20 14:15:34'),
("Reimbursement for foo", 12.32, '2016-02-20 14:15:34'),
("Reimbursement for candy", 199.99, '2017-02-20 14:15:34'),
("Reimbursement for basketball", 59.99, '2018-02-20 14:15:34'),
("Reimbursement for piano", 2898.98, '2020-02-20 14:15:34'),
("Reimbursement for guitar", 300.21, '2019-02-20 14:15:34'),
("Reimbursement for guitar", 10000.21, '2019-02-20 14:15:34');

-- 24. Reimbursement To Employee

INSERT INTO `Reimbursement To Employee` (employee, reimbursement)
VALUES (1,1),(3,2),(4,3),(30,18), (30,19), (5,4),(6,5),(7,7),(7,6),(7,8),(9,9),
(11,10),(11,12),(15,13),(16,14),(17,15),(20,16),(25,17), (31,18), (31,8);

-- 25. Business Reimbursement

INSERT INTO `Business Reimbursement` (business, reimbursement)
VALUES (1,1),(2,2),(3,3),(3,18),(3,19),(1,4),(2,5),(3,6),(3,7),(3,8),
(2,9),(1,10),(1,12),(2,13),(3,14),(1,15),(1,16),(2,17), (4,18), (4,8);

-- 26. Tax Bracket

INSERT INTO `Tax Bracket` (rate, range_start, range_end)
VALUES (.05, 0, 20000), (.07, 20001, 50000), (.10, 50001, 100000),
(.03, 0, 40000), (.06, 40001, 100000), (.10, 100001, 200000);

-- 27. Income Tax

INSERT INTO `Income Tax` (tax_type, year)
VALUES ("Single", 2021),
("Joint Marriage", 2021),
("Head of Household", 2021);

-- 28. Income Tax Bracket

INSERT INTO `Income Tax Bracket` (income_tax, tax_bracket)
VALUES ("Single",1), ("Single",2), ("Single",3), 
("Joint Marriage",4), ("Joint Marriage",5), ("Joint Marriage",6), 
("Head of Household",1),("Head of Household",3),("Head of Household",5);
-- SELECT * FROM `Income Tax Bracket`;

-- 29. State

INSERT INTO State (state_id, name)
VALUES ("CA", "California"), ("WA", "Washington"), ("NY", "New York");

-- 30. State Income Tax

INSERT INTO `State Income Tax` (state, income_tax)
VALUES ("CA", "Single"), ("CA","Joint Marriage"),("CA","Head of Household"),
("WA","Single"), ("WA","Joint Marriage"), ("WA","Head of Household"),
("NY","Single"), ("NY","Joint Marriage"), ("NY","Head of Household");

-- 31. 401k Plan

INSERT INTO `401k Plan` (percentage, employer_contribution, type)
VALUES (0.03, 0.03, "Traditional"), (0.01, 0.01, "Roth"), (0.08, NULL, "Roth");

-- 32. Salary 

INSERT INTO `Salary` (amount, year, state_tax, 401k_plan)
VALUES (60000, 2010, 1, 1), (70000, 2010, 2, NULL), (400000, 2010, 3, 3),
(50000, 2012, 4, 2), (90000, 2012, 5, 3), (89730, 2012, 6, 1),
(100000, 2014, 7, 1), (77777, 2014, 8, 2), (99923, 2014, 9, 1),
(50000, 2017, 4, 1), (90000, 2017, 5, 3), (89730, 2017, 6, 1),
(100000, 2021, 7, 1), (77777, 2021, 8, 2), (99923, 2021, 9, 1);

-- 33. Employee Salary

INSERT INTO `Employee Salary` (employee, salary)
VALUES (1,1),(1,2), (2,2), (3,3), (4,4), (5,1), (5,11), (6,2),(6,12),
(7,3), (7,13),(8,4),(8,14),(9,5),(9,15),(10,6),(10,13),(11,7),(11,14),(12,8),
(12,9),(13,1),(14,2),(15,3),(16,4),(17,5),(18,6),(19,7),(20,8),(21,9),(22,10),
(22,13),(23,11),(23,14),(24,1),(24,15),(25,1),(25,13),(26,10),(26,9),(27,11),(27,1),
(28,12),(28,3),(29,13),(29,4),(30,14),(30,7);

-- 34. Supplemental Wage

INSERT INTO `Supplemental Wage` (name, amount, description, created, state_tax)
VALUES ("Overtime", 50, "Worked 4 hours of overtime on 10/31/2021", "2017-02-20 14:15:34", 1),
("Paid Day Off", 80, "Paid day off on 10/31/2021", "2018-02-20 14:15:34", 4),
("Bonus", 10, "Employee of the month bonus", "2019-02-20 14:15:34", 7),
("Bonus", 3430, "Employee of the month bonus", "2020-02-20 14:15:34", 2),
("Overtime", 500, "Worked 4 hours of overtime on 10/31/2021", "2012-02-20 14:15:34", 5),
("Paid Day Off", 180, "Paid day off on 1/31/2021", "2000-02-20 14:15:34", 8),
("Bonus", 70, "Employee of the month bonus", "2015-02-20 14:15:34", 3),
("Bonus", 4020, "Employee of the month bonus","2010-02-20 14:15:34", 6),
("Overtime", 120, "Worked 7 hours of overtime on 10/31/2021", "2013-02-20 14:15:34", 9),
("Paid Day Off", 83, "Paid day off on 11/31/2021", "2014-02-20 14:15:34", 1),
("Bonus", 99, "Employee of the month bonus", "2005-02-20 14:15:34", 4),
("Bonus", 9876, "Employee of the month bonus", "2003-02-20 14:15:34", 7);

-- 35. Employee Supplemental Wage

INSERT INTO `Employee Supplemental Wage` (employee, supplemental_wage)
VALUES (1,1), (3,2), (4,3),(5,4),(6,5),(7,6),
(8,7), (9,8), (10,9), (11,10), (12,11),
(13,12), (14,1), (15,2), (16,3),
(17,4), (18,5), (19,6), (20,7),
(21,8), (22,9),(1,4),(3,5),(4,8),(31,12);

-- 36. Business Supplemental Wage

INSERT INTO `Business Supplemental Wage` (business, supplemental_wage)
VALUES (1,1),(2,2),(3,3),(1,4),(2,5),(3,6),(1,7),(2,8),(3,9),(1,10),(2,11),(3,12),
(1,1),(2,2),(3,3),(1,4),(2,5),(3,6),(1,7),(2,8),(3,9),(1,9),(1,4),(2,5),(3,8),(4,12),(4,12);

-- 37. Manager

INSERT INTO Manager (manager_type, employee)
VALUES ("Hiring Manager", 1), ("Finance Manager", 2), ("Manager", 3);

-- 38. Employee Managed By

INSERT INTO `Employee Managed By` (manager, employee)
VALUES (1,5), (2,6), (3,7);

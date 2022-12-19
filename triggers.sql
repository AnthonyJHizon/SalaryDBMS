USE SalaryManagementDB;

-- Trigger #1: Make account once a employee is entered into database
DROP TRIGGER IF EXISTS `Create Employee Account`;

DELIMITER $$

CREATE TRIGGER `Create Employee Account` AFTER INSERT ON Employee
FOR EACH ROW
    BEGIN
            INSERT INTO `Employee Account` (created, employee)
            VALUES (NOW(), NEW.employee_id);
    END$$

DELIMITER ;

-- SELECT * FROM Employee;
-- SELECT * FROM `Employee Account`;

-- INSERT INTO Employee (name, email, number, business)
-- VALUES ("trigger test", "test@mail.com", "14154154151", 1),
-- ("trigger test 2", "test2@mail.com", "14154154152", 2);

-- SELECT * FROM Employee;
-- SELECT * FROM `Employee Account`;

-- Trigger #2: Insert corresponding business reimbursements after an employee reimbursement is made.
DROP TRIGGER IF EXISTS `Create Business Reimbursement`;
DELIMITER $$

CREATE TRIGGER `Create Business Reimbursement` AFTER INSERT ON `Reimbursement To Employee`
FOR EACH ROW
    BEGIN
		DECLARE employee_business TINYINT;
        SET employee_business = (SELECT business FROM Employee WHERE employee_id IN 
        (Select employee from `Employee Account` where employee = NEW.employee));
		INSERT INTO `Business Reimbursement` (business, reimbursement)
        VALUES (employee_business, NEW.reimbursement);
    END$$

DELIMITER ;

-- SELECT * FROM `Reimbursement To Employee`;
-- SELECT * FROM `Business Reimbursement`;

-- INSERT INTO `Reimbursement To Employee` (employee,reimbursement)
-- VALUES (1,1),(3,2);

-- SELECT * FROM `Reimbursement To Employee`;
-- SELECT * FROM `Business Reimbursement`;

-- Trigger #3: Insert corresponding business supplemental wage payments after an employee 
-- supplemental wage payment is made.

DROP TRIGGER IF EXISTS `Create Business Supplemental`;
DELIMITER $$

CREATE TRIGGER `Create Business Supplemental` AFTER INSERT ON `Employee Supplemental Wage`
FOR EACH ROW
    BEGIN
		DECLARE employee_business TINYINT;
        SET employee_business = (SELECT business FROM Employee WHERE employee_id IN 
        (Select employee from `Employee Account` where employee = NEW.employee));
		INSERT INTO `Business Supplemental Wage` (business, supplemental_wage)
        VALUES (employee_business, NEW.supplemental_wage);
    END$$

DELIMITER ;

-- SELECT * FROM `Employee Supplemental Wage`;
-- SELECT * FROM `Business Supplemental Wage`;

-- INSERT INTO `Employee Supplemental Wage` (employee, supplemental_wage)
-- VALUES (1,1),(2,2);

-- SELECT * FROM `Employee Supplemental Wage`;
-- SELECT * FROM `Business Supplemental Wage`;

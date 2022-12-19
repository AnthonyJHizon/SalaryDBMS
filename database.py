# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
from prettytable import PrettyTable

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")


def get_response(msg): 
  data = msg.split()
  errors = []
  response = None
  command = data[0]
  if "/find-business-by-state-supplemental-wage" == command: 
     if len(data) != 5:
       errors.append("Incorrect Input. /find-business-by-state-supplemental-wage <state> <#amount> <#year begin> <#year end>")
     else: 
       state = data[1]
       amount = data[2]
       year_begin = data[3]
       year_end = data[4] 
       response = business_rule_1(state,amount,year_begin,year_end)
  elif "/find-employees-benefit-position" == command:
     if len(data) != 3:
       errors.append("Incorrect Input. /find-employees-benefit-position <#benefits x> <#poistions y>")
     else: 
       benefits = data[1]
       positions = data[2] 
       response = business_rule_2(benefits, positions)
  elif "/find-employees-salary" == command:
     print(command) 
     if len(data) != 4:
       errors.append("Incorrect Input. /find-employees-salary <#salary  x> <#yearbegin y> <#year end z>")
     else: 
       salary = data[1]
       year_begin = data[2]
       year_end = data[3] 
       response = business_rule_3(salary,year_begin,year_end)
  elif "/businesses-position-breakdown" == command: 
     if len(data) == 1:
       response = business_rule_4a()
     elif len(data) == 2: 
       business = data[1]
       response = business_rule_4b(business)
     else:
       errors.append("Incorrect Input. /businesses-position-breakdown <OPTIONAL buisness name x>")
  elif "/find-state-by-business-rembursement" == command: 
     if len(data) != 3:
       errors.append("Incorrect Input. /find-state-by-business-rembursement <#amount x> <#year y>")
     else: 
       amount = data[1]
       year = data[2]
       response = business_rule_5(amount,year)
  elif "/find-employees-by-business-state-401kpercentage" == command: 
     if len(data) != 4:
       errors.append("Incorrect Input. /find-employees-by-business-state-401kpercentage <business x> <state y> <#401k percentage z>")
     else: 
       business = data[1]
       state = data[2]
       percentage = data[3]
       response = business_rule_6(business,state,percentage)
  elif "/find-employees-salary-tax-year" == command: 
     if len(data) != 4:
       errors.append("Incorrect Input. /find-employees-salary-tax-year <#amount x> <#taxrate y> <#year z>")
     else: 
       amount = data[1]
       rate = data[2]
       year = data[3]
       response = business_rule_7(amount,rate,year)
  if len(errors) >= 1: 
    return errors 
  return response 



# create the business rules functions 

def business_rule_1(state,amount,year_begin,year_end):
  #output = None
  conn = connect()
  rows = []
  headers = ["State", "Business", "Amount"] 
  if conn: 
    # there is a connection with the database
    cursor = conn.cursor() 
    query = """Select address.state AS "State", business.name AS "Business", SUM(supplemental.amount) AS "Supplemental Wage Amount"
    FROM `Business Supplemental Wage`
    JOIN Business business ON `Business Supplemental Wage`.business = business.business_id
    JOIN `Supplemental Wage` supplemental ON `Business Supplemental Wage`.supplemental_wage = supplemental.supplemental_wage_id
    JOIN Address address ON business.address = address_id
    WHERE address.state = %s AND YEAR(supplemental.created) >= %s AND YEAR(supplemental.created) <= %s
    GROUP BY business.name, address.state
    HAVING SUM(supplemental.amount) > %s
    ORDER BY SUM(supplemental.amount) DESC;"""
    variable = (state,year_begin,year_end,amount)
    cursor.execute(query, variable)
    data = cursor.fetchall() # returns all the results from the query 
    if data: # check that data is not Null 
       for data in data: 
           row = []
           state = data["State"]
           business = data["Business"]
           amount = data["Supplemental Wage Amount"]
           row.append(state)
           row.append(business)
           row.append(amount)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

   


def business_rule_2(benefits, positions): 
  conn = connect()
  rows = []
  headers = ["Business", "Employee", "Benefits", "Positions"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT T.Business AS "Business", T.Employee AS "Employee", COUNT(`Employee Benefit`.employee) AS "Benefits", T.Positions AS "Positions"
    FROM (SELECT business.name AS "Business", `Employee Account`.employee AS "Account ID", employee.name AS "Employee", COUNT(`Employee Position`.employee) AS "Positions"
	    FROM Employee employee
	    JOIN Business business ON business.business_id = employee.business
	    JOIN `Employee Account` ON `Employee Account`.employee = employee.employee_id
	    JOIN `Employee Position` ON `Employee Position`.employee = `Employee Account`.employee
	    GROUP BY business.name, employee.name, `Account ID`
	    HAVING COUNT(`Employee Position`.employee) >= %s) AS T
    JOIN `Employee Benefit` ON `Employee Benefit`.employee = T.`Account ID`
    GROUP BY T.business, T.employee, T.`Account ID`
    HAVING COUNT(`Employee Benefit`.employee) >= %s;""" 
    variable = (benefits, positions)
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           business = data["Business"]
           employee = data["Employee"]
           benefits = data["Benefits"]
           positions = data["Positions"]
           row.append(business)
           row.append(employee)
           row.append(benefits)
           row.append(positions)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again" 


def business_rule_3(salary,year_begin,year_end): 
  conn = connect()
  rows = []
  headers = ["Business", "Employee", "Average Salary"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT business.name AS "Business", employee.name AS "Employee", CAST(AVG(salary.amount) AS DECIMAL(10,2)) AS "Amount"
    FROM Employee employee
    JOIN Business business ON business.business_id = employee.business
    JOIN `Employee Account` ON `Employee Account`.employee = employee.employee_id
    JOIN `Employee Salary` ON `Employee Salary`.employee = `Employee Account`.employee
    JOIN Salary salary ON `Employee Salary`.salary = salary.salary_id
    WHERE salary.year >= %s AND salary.year <= %s
    GROUP BY business.name, employee.name
    HAVING AVG(salary.amount) >= %s
    ORDER BY AVG(salary.amount) DESC;""" 
    variable = (year_begin,year_end,salary)
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           business = data["Business"]
           employee = data["Employee"]
           avg_salary = data["Amount"]
           row.append(business)
           row.append(employee)
           row.append(avg_salary)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

def business_rule_4a(): 
  conn = connect()
  rows = []
  headers = ["Business", "Position", "Number of Employees"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT T.Business AS "Business", T.Position AS "Position", COUNT(T.Position) as "Number of Employees"
    FROM (SELECT business.name AS "Business", employee.name AS "Employee", position.name AS "Position"
	    FROM Employee employee
	    JOIN Business business ON business.business_id = employee.business
	    JOIN `Employee Account` ON `Employee Account`.employee = employee.employee_id
	    JOIN `Employee Position` ON `Employee Position`.employee = `Employee Account`.employee
	    JOIN Position position ON `Employee Position`.position = position.position_id
	    GROUP BY business.name, employee.name, position.name
    ORDER BY business.name, position.name, employee.name) as T
    GROUP BY T.Business, T.Position ;""" 
    variable = ()
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           business = data["Business"]
           position = data["Position"]
           total = data["Number of Employees"]
           row.append(business)
           row.append(position)
           row.append(total)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

def business_rule_4b(business): 
  conn = connect()
  rows = []
  headers = ["Business", "Position", "Number of Employees"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT T.Business AS "Business", T.Position AS "Position", COUNT(T.Position) as "Number of Employees"
    FROM (SELECT business.name AS "Business", employee.name AS "Employee", position.name AS "Position"
	    FROM Employee employee
	    JOIN Business business ON business.business_id = employee.business
	    JOIN `Employee Account` ON `Employee Account`.employee = employee.employee_id
	    JOIN `Employee Position` ON `Employee Position`.employee = `Employee Account`.employee
	    JOIN Position position ON `Employee Position`.position = position.position_id
	    GROUP BY business.name, employee.name, position.name
    ORDER BY business.name, position.name, employee.name) as T
    WHERE T.Business = %s
    GROUP BY T.Business, T.Position ;""" 
    variable = (business)
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           business = data["Business"]
           position = data["Position"]
           total = data["Number of Employees"]
           row.append(business)
           row.append(position)
           row.append(total)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

def business_rule_5(amount,year): 
  conn = connect()
  rows = []
  headers = ["State", "Number of Businesses"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT * FROM (
    SELECT satisfied_businesses.state AS "State", COUNT(satisfied_businesses.state) AS numOfBusinesses
    FROM (SELECT address.state as "State", business.name as "Business", SUM(reimbursement.amount) as "Reimbursement Amount"
        FROM `Business Reimbursement`
        JOIN Business business ON `Business Reimbursement`.business = business_id
        JOIN Reimbursement reimbursement ON `Business Reimbursement`.reimbursement = reimbursement_id
        JOIN Address address ON  business.address = address_id
        WHERE YEAR(reimbursement.created) = %s
        GROUP BY business.name, address.state
        HAVING SUM(reimbursement.amount) >= %s) AS satisfied_businesses
    GROUP BY satisfied_businesses.state
    ORDER BY numOfBusinesses DESC
    ) AS t
    WHERE t.numOfBusinesses = (
    SELECT MAX(t.numOfBusinesses) FROM (
        SELECT satisfied_businesses.state AS "State", COUNT(satisfied_businesses.state) AS numOfBusinesses
        FROM (SELECT address.state as "State", business.name as "Business", SUM(reimbursement.amount) as "Reimbursement Amount"
            FROM `Business Reimbursement`
            JOIN Business business ON `Business Reimbursement`.business = business_id
            JOIN Reimbursement reimbursement ON `Business Reimbursement`.reimbursement = reimbursement_id
            JOIN Address address ON  business.address = address_id
            WHERE YEAR(reimbursement.created) = %s
            GROUP BY business.name, address.state
            HAVING SUM(reimbursement.amount) >= %s) AS satisfied_businesses
        GROUP BY satisfied_businesses.state
        ORDER BY numOfBusinesses DESC
    ) AS t);""" 
    variable = (year, amount, year, amount)
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           state = data["State"]
           numOfBusinesses = data["numOfBusinesses"]
           row.append(state)
           row.append(numOfBusinesses)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

def business_rule_6(business,state,percentage): 
  conn = connect()
  rows = []
  headers = ["State","Business","Employee","401k Percentage"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT address.state AS "State", business.name AS "Business",  employee.name AS "Employee", plan.percentage AS "401k Percentage"
    FROM Employee employee    
    JOIN Business business ON business.business_id = employee.business
    JOIN Address address ON  business.address = address_id
    JOIN `Employee Account` ON `Employee Account`.employee = employee.employee_id
    JOIN `Employee Salary` ON `Employee Salary`.employee = `Employee Account`.employee
    JOIN Salary salary ON `Employee Salary`.salary = salary.salary_id
    JOIN `401k Plan` plan ON salary.`401k_plan` = plan.plan_id
    WHERE address.state = %s AND business.name = %s AND plan.percentage >= %s
    GROUP BY business.name, address.state, employee.name, plan.percentage
    ORDER BY "401k Percentage" DESC;""" 
    variable = (state,business,percentage)
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           state = data["State"]
           business = data["Business"]
           employee = data["Employee"]
           percentage = data["401k Percentage"]
           row.append(state)
           row.append(business)
           row.append(employee)
           row.append(percentage)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"

def business_rule_7(amount,rate,year): 
  conn = connect()
  rows = []
  headers = ["Business", "Employee", "Salary", "Tax Type", "Tax Rate"] 
  if conn: 
    cursor = conn.cursor() 
    query = """SELECT business.name AS "Business",  employee.name AS "Employee", salary.amount AS "Salary", `Income Tax`.tax_type AS "Tax Type", `Tax Bracket`.rate AS "Tax Rate", salary.year AS "Year"
    FROM Employee employee
    JOIN Business business ON business.business_id = employee.business
    JOIN Address address ON  business.address = address_id
    JOIN `Employee Account` ON `Employee Account`.employee = employee.employee_id
    JOIN `Employee Salary` ON `Employee Salary`.employee = `Employee Account`.employee
    JOIN Salary salary ON `Employee Salary`.salary = salary.salary_id
    JOIN `401k Plan` plan ON salary.`401k_plan` = plan.plan_id
    JOIN `State Income Tax` ON salary.state_tax = `State Income Tax`.state_tax_id
    JOIN `Income Tax` ON `State Income Tax`.income_tax = `Income Tax`.tax_type
    JOIN `Income Tax Bracket` ON `Income Tax`.tax_type = `Income Tax Bracket`.income_tax
    JOIN `Tax Bracket` ON `Income Tax Bracket`.tax_bracket = `Tax Bracket`.bracket_id
    WHERE salary.amount > %s AND `Tax Bracket`.rate >= %s AND salary.year = %s AND `Tax Bracket`.range_end <= salary.amount AND `Tax Bracket`.range_end >= salary.amount
    GROUP BY business.name, address.state, employee.name, salary.amount, `Income Tax`.tax_type, `Tax Bracket`.rate, salary.year
    ORDER BY business.name ASC, salary.amount DESC;""" 
    variable = (amount,rate,year)
    cursor.execute(query, variable)
    data = cursor.fetchall()
    if data: 
       for data in data: 
           row = []
           business = data["Business"]
           employee = data["Employee"]
           salary = data["Salary"]
           tax_type = data["Tax Type"]
           tax_rate = data["Tax Rate"]
           row.append(business)
           row.append(employee)
           row.append(salary)
           row.append(tax_type)
           row.append(tax_rate)
           rows.append(row)
    output = format_data(headers, rows)
    conn.close()
    return output 
  conn.close()
  return "There is an internal problem. Try later again"     


def format_data(headers, rows ):   
  table = PrettyTable() 
  table.field_names = headers
  for row in rows: 
    table.add_row(row)
  return "``\n" + table.get_string() + "\n``"

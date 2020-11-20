# Challenge 1
# In the database, there is the concept of Customer and Employee. The company wants to create a
# new concept, called Contact, which may be either a customer or an employee. You are asked to
# develop a unified view over the Customer and Employee tables to provide this new concept. The
# view should use the common attributes between both tables.

create or replace view Contact(FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Fax, Email) as
	select FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Fax, Email
	from Customer

	union

	select FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Fax, Email
	from Employee;
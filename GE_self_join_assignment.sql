drop table if exists relationships;

CREATE TABLE relationships (
  Parent_Company char(16),
  Primary_Business_Unit varchar(25),
  Subsidary_Business_Branch varchar(40)
);

insert into relationships values 
('General_Electric', 'GE_Capital', 'GE_Capital_Aviation_Services'), 
('General_Electric', 'GE_Capital', 'GE_Energy_Financial_Services'), 
('General_Electric', 'GE_Energy_Management', 'GE_Power_Electronics'), 
('General_Electric', 'GE_Energy_Management', 'GE_Power_Components'), 
('General_Electric', 'GE_Oil&Gas', '');

select * from relationships;
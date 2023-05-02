drop table if exists talents cascade;
drop table if exists persons cascade;
drop table if exists affiliations;
drop table if exists talent_depth;

CREATE TABLE talents (
  talent varchar(25) primary key
);

CREATE TABLE persons (
  person varchar(15) primary key
);

Create table affiliations (
	person_id varchar(15) references persons(person),
	talent_id varchar(25) references talents(talent)
);

insert into talents
values ('Project_Management'), ('Data_Wrangling'), ('Data_Analysis'), ('Subject_Expertise'), ('Design'), ('Storytelling');

insert into persons
values ('Anand'), ('Cameron'), ('Emily'), ('Kevin'), ('Roberto'), ('Stephani'), ('Susan'), ('Xia-Li');

insert into affiliations
values ('Anand', 'Design'), 
('Anand', 'Storytelling'),
('Cameron', 'Data_Wrangling'),
('Emily', 'Project_Management'), 
('Kevin', 'Data_Wrangling'),
('Kevin', 'Project_Management'),
('Roberto', 'Data_Wrangling'),
('Roberto', 'Data_Analysis'),
('Roberto', 'Design'),
('Roberto', 'Subject_Expertise'),
('Stephani', 'Design'),
('Stephani', 'Subject_Expertise'),
('Susan', 'Data_Analysis'),
('Susan', 'Subject_Expertise'),
('Xia-Li', 'Data_Analysis'),
('Xia-Li', 'Storytelling'),
('Xia-Li', 'Subject_Expertise');

CREATE TABLE talent_depth AS
(select count(talent_id) as depths, talent from affiliations as a
inner join persons as p
on p.person = a.person_id
inner join talents as t
on a.talent_id = t.talent
group by talent);

select talent, depths from talent_depth;
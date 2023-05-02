-- flights_start_ddl.sql
-- 01/27/2022
-- loads 5 .csv files into tables in flights database
-- documentation: https://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf

-- start by creating a new database, e.g. nycflights
-- use Excel or Google Sheets to study the data in the five .CSV files
-- study the code for creating and populating the airports and flights tables
-- we'll create the planes table together
-- for homework, you'll then create the airlines and weather tables 

DROP TABLE IF EXISTS airports;

CREATE TABLE airports (
  faa varchar(3) PRIMARY KEY,
  name varchar(70) NOT NULL,
  lat float NOT NULL,
  lon float NOT NULL,
  alt int NOT NULL,
  tz int NOT NULL,
  dst CHAR(1) NOT NULL,
  tzone varchar(20) NULL
);

COPY airports FROM 'c:/users/public/airports.csv' csv header null 'NA';

SELECT * FROM airports;

DROP TABLE IF EXISTS flights;

CREATE TABLE flights (
year integer,
month integer,
day integer,
dep_time integer,
sched_dep_time integer,
dep_delay integer,
arr_time integer,
sched_arr_time integer,
arr_delay integer,
carrier char(2),
flight integer,
tailnum char(6),
origin char(3),
dest char(3),
air_time integer,
distance integer,
hour integer,
minute integer,
time_hour timestamptz
);

COPY flights FROM 'c:/users/public/flights.csv' csv header null 'NA';

SELECT count(*) FROM flights;

-- TO DO: create planes tables

-- TO DO: load data into planes table from .CSV file

-- TO DO: display data in planes table

-- TO DO: repeat process for airports and weather tables

DROP TABLE IF EXISTS airlines;

CREATE TABLE airlines (
carrier char(2),
name varchar(99) NOT NULL
);

COPY airlines FROM 'c:/users/public/airlines.csv' csv header null 'NA';

select * from airlines

DROP TABLE IF EXISTS planes;

CREATE TABLE planes (
tailnum char(6),
year integer,
type varchar(99) NOT NULL,
manufacturer char(99),
model char(99),
engines integer,
seats integer,
speed integer,
engine varchar(99)
);

COPY planes FROM 'c:/users/public/planes.csv' csv header null 'NA';

SELECT * FROM planes;

DROP TABLE IF EXISTS weather;

CREATE TABLE weather (
origin char(3),
year integer,
month integer,
day integer,
hour integer,
temp numeric,
dewp numeric,
humid numeric,
wind_dir integer,
wind_speed float,
wind_guest float,
precip numeric,
pressure numeric,
visib numeric,
time_hour timestamptz
);

COPY weather FROM 'c:/users/public/weather.csv' csv header null 'NA';

SELECT * FROM weather;

select carrier from flights limit 10;
select * from airlines;


select carrier, count(*) as num_flights from flights
group by carrier
order by num_flights desc;

select * from flights;
select * from airlines;

select *
from airlines join flights
on airlines.carrier = flights.carrier;

select name, count(*) as airlines from flights
where origin in ('JFK', 'EWR', 'LGA')
group by name
order by airlines desc;

select name, count (*) as airlines
from airlines join flights
on airlines.carrier = flights.carrier
where origin in ('JFK', 'EWR', 'LGA')
group by name
order by airlines desc;

select * from weather;

select * from planes;


create table planedata (
	tailnum varchar(16),
	type varchar(16),
	manufacturer varchar(32),
	issue_date varchar(16),
	model varchar(16),
	status varchar(16),
	aircraft_type varchar(32),
	engine_type varchar(16),
	year int
);

load data local infile 'plane-data.csv' into table planedata
	fields terminated by ','
	enclosed by '"'
	lines terminated by '\n'
	ignore 1 lines;

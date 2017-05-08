create table airports (
	itia varchar(5),
	city varchar(50),
	state varchar(5),
	country varchar(50),
	lat float,
	lon float
);

load data local infile 'airports.csv' into table airports
	field (
		terminate	by ','
		endclose by '"'
	)
	lines terminate by '\n'
	ignore 1 lines;

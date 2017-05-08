create table record (
	year int,
	month int,
	dayofmonth int,
	dayofweek int,
	deptime int,
	crsdeptime int,
	arrtime int,
	crsarrtime int,
	uniquecarrier varchar(10),
	flightnum int,
	tailnum int,
	actualelapsedtime int,
	crselapsedtime int,
	airtime int,
	arrdelay int,
	depdelay int,
	origin int,
	dest int,
	distance int,
	taxiin int;
	taxiout int;
	cancelled int,
	cancellationcode int,
	diverted int,
	carrierdelay int,
	weather delay int,
	nasdelay int,
	securitydelay int,
	lateaircraftdelay int
);

load data local infild '2008.csv' into table record
	field (
		terminated by ','
		enclosed by '"'
	)
	lines terminated by '\n'
	ignore 1 lines;

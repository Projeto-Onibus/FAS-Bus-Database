CREATE TABLE bus_insertion (
    time_detection TIMESTAMP WITHOUT TIME ZONE,
    bus_id VARCHAR(10),
    latitude FLOAT,
    longitude FLOAT,
    line_reported VARCHAR (8),
    line_detected VARCHAR (8)
);

CREATE TABLE bus_data (
    time_detection TIMESTAMP WITHOUT TIME ZONE,
    bus_id VARCHAR(10),
    latitude FLOAT,
    longitude FLOAT,
    line_reported VARCHAR (8),
    line_detected VARCHAR (8)
    
) PARTITION BY RANGE(time_detection);

CREATE TABLE line_data (
    line_id VARCHAR(8),
    direction CHAR(1),
    position SMALLINT,
    latitude FLOAT,
    longitude FLOAT
);

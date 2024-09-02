-- Database for bus data
CREATE DATABASE buses;
CREATE USER buses WITH ENCRYPTED PASSWORD 'buses';
\connect buses
CREATE TABLE bus_trajectories (
    time_detection TIMESTAMPTZ NOT NULL,
    bus_id CHAR(10) NOT NULL,
    line CHAR(8),
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL
);
CREATE TABLE bus_trajectories_raw (
    time_detection TIMESTAMPTZ,
    bus_id CHAR(10),
    line CHAR(8),
    latitude FLOAT,
    longitude FLOAT
);
SELECT create_hypertable('bus_trajectories','time_detection',chunk_time_interval => INTERVAL '1 day');
CREATE UNIQUE INDEX idx_bus_id ON bus_trajectories(bus_id,time_detection);
GRANT ALL PRIVILEGES ON DATABASE buses TO buses;
GRANT CREATE ON SCHEMA public TO buses;
GRANT ALL PRIVILEGES ON TABLE bus_trajectories TO buses;
GRANT ALL PRIVILEGES ON TABLE bus_trajectories_raw TO buses;

-- Database for line data
CREATE DATABASE lines;
CREATE USER lines WITH ENCRYPTED PASSWORD 'lines';
\connect lines
CREATE TABLE line_trajectories (
    name CHAR(10) NOT NULL,
    direction INTEGER NOT NULL,
    position INTEGER NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL
);
GRANT ALL PRIVILEGES ON DATABASE lines TO lines;
GRANT CREATE ON SCHEMA public TO lines;
GRANT ALL PRIVILEGES ON TABLE line_trajectories  TO lines;

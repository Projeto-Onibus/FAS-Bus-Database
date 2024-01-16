CREATE TABLE bus_trajectories (
    time_detection TIMESTAMPTZ NOT NULL,
    bus_id CHAR(10) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL
);

SELECT create_hypertable('bus_trajectories','time_detection',chunk_time_interval => INTERVAL '1 day');
CREATE UNIQUE INDEX idx_bus_id ON bus_trajectories(bus_id,time_detection);

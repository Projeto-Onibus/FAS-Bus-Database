CREATE TABLE bus_trajectories (
    time_detection TIMESTAMPTZ,
    bus_id VARCHAR(10),
    latitude FLOAT,
    longitude FLOAT,
) PARTITION BY RANGE(time_detection);

SELECT create_hypertable('bus_trajectories','time_detection',chunk_time_interval => INTERVAL '1 day');

CREATE UNIQUE INDEX idx_bus_id ON bus_trajectories(bus_id,time_detection);

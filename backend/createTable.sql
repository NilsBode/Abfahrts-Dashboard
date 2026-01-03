CREATE TABLE stations(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name TEXT,
    display_name TEXT,
    lat float,
    lon float,
    rmv_id VARCHAR(32),
    is_active bool
);

CREATE TABLE `lines`
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    line_name VARCHAR(20),
    line_direction TEXT,
    color VARCHAR(7)
);

CREATE TABLE vehicles(
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_number VARCHAR(10),
    line_id INT,
    vehicle_type VARCHAR(4),
    lat FLOAT,
    lon FLOAT,
    speed FLOAT,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(line_id) REFERENCES `lines` (id)
);

CREATE TABLE route_stops(
    id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT NOT NULL,
    station_id INT NOT NULL,
    stop_number INT NOT NULL,
    direction bool NOT NULL,
    FOREIGN KEY(line_id) REFERENCES `lines`(id),
    FOREIGN KEY(station_id) REFERENCES stations(id),
    INDEX ix_route(line_id, station_id, direction),
    INDEX ix_route_order(line_id, stop_number, direction),
    UNIQUE KEY uq_route_pos (line_id, direction, stop_number),
    UNIQUE KEY uq_route_station (line_id, direction, station_id)
);

CREATE TABLE stop_times(
    id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT NOT NULL,
    stop_id INT NOT NULL,
    planned_arrival DATETIME,
    planned_departure DATETIME,
    real_arrival DATETIME,
    real_departure DATETIME,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(line_id) REFERENCES `lines`(id),
    FOREIGN KEY(stop_id) REFERENCES stations(id),
    INDEX ix_planned_stop (stop_id, planned_departure, line_id),
    INDEX ix_real_stop (stop_id, line_id, real_departure)
);
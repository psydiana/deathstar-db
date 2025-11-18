-- DATABASE CREATION --
CREATE DATABASE deathstardb;
USE deathstardb;

-- SUBSYSTEMS --
CREATE TABLE subsystem (
    subsystem_id VARCHAR(40) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- HARDWARE MODULES --
CREATE TABLE hardware_module (
    module_id VARCHAR(40) PRIMARY KEY,
    subsystem_id VARCHAR(40),
    type VARCHAR(20),
    manufacturer VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (subsystem_id)
        REFERENCES subsystem(subsystem_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- SOFTWARE COMPONENTS --
CREATE TABLE software_component (
    sw_id VARCHAR(40) PRIMARY KEY,
    subsystem_id VARCHAR(40),
    version VARCHAR(20),
    language VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (subsystem_id)
        REFERENCES subsystem(subsystem_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- TELEMETRY LOGS --
CREATE TABLE telemetry_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id VARCHAR(40),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    value VARCHAR(20),
    FOREIGN KEY (module_id)
        REFERENCES hardware_module(module_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- MAINTENANCE EVENTS --
CREATE TABLE maintenance_event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    module_id VARCHAR(40),
    date DATE,
    technician VARCHAR(50),
    details VARCHAR(255),
    FOREIGN KEY (module_id)
        REFERENCES hardware_module(module_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- ALERTS --
CREATE TABLE alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    subsystem_id VARCHAR(40),
    severity VARCHAR(20),
    message VARCHAR(255),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subsystem_id)
        REFERENCES subsystem(subsystem_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

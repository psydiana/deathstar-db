INSERT INTO alerts (subsystem_id, severity, message, timestamp) VALUES
('reactor_core', 'critical', 'Reactor overheating detected', NOW()),
('reactor_core', 'warning', 'Regulator output unstable', NOW()),
('superlaser', 'warning', 'Cooling efficiency below threshold', NOW()),
('navigation', 'info', 'Hyperspace calibration completed', NOW()),
('security_net', 'alert', 'Unauthorized access detected in Hangar Bay 327', NOW()),
('hangar_bay', 'warning', 'Tractor beam power spike', NOW());

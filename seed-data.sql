-- ============================================================
-- K-TRACE: Kabankalan City — Comprehensive Demo Data
-- ============================================================
-- Covers: Barangays, Sangguniang Panlungsod, SK, City Departments
-- Includes: Delayed projects, flagged items, citizen reports
-- ============================================================

-- Step 1: Add 'Delayed' status to projects
ALTER TABLE projects DROP CONSTRAINT IF EXISTS projects_status_check;
ALTER TABLE projects ADD CONSTRAINT projects_status_check
  CHECK (status IN ('Pending', 'Ongoing', 'Completed', 'Delayed'));

-- Step 2: Clear existing seed data (safe — only removes demo data)
DELETE FROM citizen_reports;
DELETE FROM budget_items;
DELETE FROM projects;

-- ============================================================
-- PROJECTS (15 total)
-- ============================================================

-- 1. Brgy. Camingawan — Health Center (Ongoing)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111101',
  'Barangay Health Center Construction',
  'Construction of a two-story barangay health center with 6 consultation rooms, pharmacy area, and emergency response unit.',
  'Barangay Camingawan', 4500000, 'Brgy. Camingawan, Kabankalan City', 'Ongoing',
  '2025-01-15');

-- 2. Brgy. Hilamonan — Farm-to-Market Road (Delayed!)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111102',
  'Farm-to-Market Road Improvement',
  'Upgrading 3.2 km of unpaved road from Sitio Tambo to the barangay proper to support sugarcane and rice transport.',
  'Barangay Hilamonan', 8200000, 'Brgy. Hilamonan, Kabankalan City', 'Delayed',
  '2024-06-10');

-- 3. Sangguniang Panlungsod — IT Lab Equipment (Completed)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111103',
  'Public School IT Lab Equipment',
  'Procurement of 40 desktop units, networking equipment, and smartboards for Kabankalan National High School.',
  'Sangguniang Panlungsod', 3200000, 'Kabankalan National High School', 'Completed',
  '2024-09-01');

-- 4. Brgy. Daan Banwa — Flood Control (Ongoing)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111104',
  'Flood Control & Drainage System',
  'Installation of reinforced concrete drainage system and flood gate along Tabao River to protect 200+ households.',
  'Barangay Daan Banwa', 12500000, 'Tabao River, Brgy. Daan Banwa', 'Ongoing',
  '2025-02-20');

-- 5. SK Federation — Livelihood Program (Completed)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111105',
  'SK Youth Livelihood & Skills Training',
  'Livelihood training program for out-of-school youth: welding, baking, and digital literacy. Includes starter kits.',
  'Sangguniang Kabataan (SK Federation)', 1800000, 'Kabankalan City Sports Complex', 'Completed',
  '2024-11-05');

-- 6. Brgy. Tan-awan — Day Care Center (Pending)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111106',
  'Day Care Center Renovation',
  'Complete renovation of the barangay day care center including new roofing, flooring, comfort room, and learning materials.',
  'Barangay Tan-awan', 950000, 'Brgy. Tan-awan, Kabankalan City', 'Pending',
  '2025-04-01');

-- 7. Sangguniang Panlungsod — Street Lighting (Delayed!)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111107',
  'LED Street Lighting Upgrade — Poblacion',
  'Replacement of 250 street light posts with solar-powered LED fixtures across the Poblacion district. Originally due Dec 2024.',
  'Sangguniang Panlungsod', 6800000, 'Poblacion, Kabankalan City', 'Delayed',
  '2024-03-15');

-- 8. Brgy. Binicuil — Water System (Ongoing)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111108',
  'Level III Water System Installation',
  'Installation of deep well pump, elevated water tank, and distribution pipelines serving 350 households.',
  'Barangay Binicuil', 5600000, 'Brgy. Binicuil, Kabankalan City', 'Ongoing',
  '2025-03-10');

-- 9. City Engineering — Public Market (Pending)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111109',
  'New Public Market — Phase 2 Expansion',
  'Expansion of Kabankalan Public Market: 80 additional stalls, improved drainage, fire exits, and CCTV coverage.',
  'City Engineering Office', 22000000, 'Kabankalan Public Market', 'Pending',
  '2025-05-20');

-- 10. SK — Sports Facility (Ongoing)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111110',
  'Multi-Purpose Sports Court — Barangay Salong',
  'Construction of covered multi-purpose court with grandstand seating, lighting, and basketball/volleyball markings.',
  'Sangguniang Kabataan — Brgy. Salong', 3500000, 'Brgy. Salong, Kabankalan City', 'Ongoing',
  '2025-01-28');

-- 11. Brgy. Tapi — Evacuation Center (Delayed!)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111111',
  'Barangay Evacuation Center',
  'Construction of typhoon-resilient evacuation center with capacity for 500 evacuees. Delayed due to material supply issues.',
  'Barangay Tapi', 9800000, 'Brgy. Tapi, Kabankalan City', 'Delayed',
  '2024-08-01');

-- 12. City Health Office — Medical Equipment (Completed)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111112',
  'Rural Health Unit Medical Equipment',
  'Procurement of X-ray machine, ultrasound unit, nebulizers, and laboratory equipment for 3 Rural Health Units.',
  'City Health Office', 7200000, 'Kabankalan City Health Office', 'Completed',
  '2024-07-15');

-- 13. Brgy. Ilog-Ilog — Bridge Repair (Pending)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111113',
  'Barangay Bridge Rehabilitation',
  'Structural rehabilitation and widening of the Ilog-Ilog Bridge to accommodate larger vehicles and improve safety.',
  'Barangay Ilog-Ilog', 6500000, 'Brgy. Ilog-Ilog, Kabankalan City', 'Pending',
  '2025-06-01');

-- 14. Sangguniang Panlungsod — Solid Waste (Ongoing)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111114',
  'Solid Waste Management — Materials Recovery Facility',
  'Construction of city-wide MRF with composting area, recyclables sorting, and sanitary landfill improvement.',
  'Sangguniang Panlungsod', 15000000, 'Kabankalan City Sanitary Landfill', 'Ongoing',
  '2025-02-01');

-- 15. Brgy. Guintubhan — Solar Power (Completed)
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111115',
  'Off-Grid Solar Power for Remote Sitios',
  'Installation of 50 solar panel kits for households in 3 remote sitios without NOCECO power grid access.',
  'Barangay Guintubhan', 2800000, 'Brgy. Guintubhan, Kabankalan City', 'Completed',
  '2024-10-20');

-- ============================================================
-- BUDGET ITEMS (multiple per project — some flagged!)
-- ============================================================

-- Project 1: Brgy. Camingawan Health Center
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111101', 'Portland Cement (40kg)', 500, 'bags', 265, 265, NULL),
('11111111-1111-1111-1111-111111111101', 'Deformed Steel Bar 10mm', 800, 'pcs', 185, 185, NULL),
('11111111-1111-1111-1111-111111111101', 'CHB 4" Hollow Blocks', 5000, 'pcs', 12, 14, 'Higher transport cost to remote barangay'),
('11111111-1111-1111-1111-111111111101', 'Roofing — Colored Long Span', 200, 'sheets', 480, 620, NULL),
('11111111-1111-1111-1111-111111111101', 'Plywood 1/4" Marine', 120, 'sheets', 380, 380, NULL),
('11111111-1111-1111-1111-111111111101', 'Electrical Wiring & Panel', 1, 'lot', 85000, 125000, 'Medical-grade wiring required per DOH standards');

-- Project 2: Brgy. Hilamonan Farm Road (DELAYED — flagged items)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111102', 'Gravel & Sand Fill', 800, 'cu.m', 850, 1200, NULL),
('11111111-1111-1111-1111-111111111102', 'Concrete Road Mix', 400, 'cu.m', 3500, 3500, NULL),
('11111111-1111-1111-1111-111111111102', 'Road Base Course', 600, 'cu.m', 1100, 1550, NULL),
('11111111-1111-1111-1111-111111111102', 'Backhoe Rental', 45, 'days', 8000, 12000, 'Only 1 available backhoe in the area — high demand'),
('11111111-1111-1111-1111-111111111102', 'Steel Culvert Pipes 36"', 20, 'pcs', 15000, 22000, NULL),
('11111111-1111-1111-1111-111111111102', 'Labor — Road Workers', 30, 'persons', 500, 500, NULL);

-- Project 3: IT Lab Equipment (Completed)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111103', 'Desktop PC (Core i5, 8GB, 256GB)', 40, 'units', 32000, 32000, NULL),
('11111111-1111-1111-1111-111111111103', 'Smart Board 75"', 2, 'units', 180000, 195000, 'Includes installation and calibration'),
('11111111-1111-1111-1111-111111111103', 'Network Switch 48-port', 3, 'units', 45000, 45000, NULL),
('11111111-1111-1111-1111-111111111103', 'UPS 1500VA', 10, 'units', 8500, 8500, NULL),
('11111111-1111-1111-1111-111111111103', 'Wireless Access Point', 5, 'units', 6500, 6500, NULL),
('11111111-1111-1111-1111-111111111103', 'CAT6 Cabling & Installation', 1, 'lot', 75000, 95000, NULL);

-- Project 4: Flood Control (Ongoing)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111104', 'Reinforced Concrete Pipe 48"', 100, 'pcs', 18000, 18000, NULL),
('11111111-1111-1111-1111-111111111104', 'Excavation Works', 2000, 'cu.m', 350, 420, 'Rocky terrain — specialized equipment needed'),
('11111111-1111-1111-1111-111111111104', 'Flood Gate — Stainless Steel', 2, 'units', 850000, 1200000, NULL),
('11111111-1111-1111-1111-111111111104', 'Gabion Baskets', 500, 'pcs', 1200, 1200, NULL),
('11111111-1111-1111-1111-111111111104', 'Riprap Stones', 300, 'cu.m', 800, 800, NULL);

-- Project 5: SK Livelihood (Completed)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111105', 'Welding Machine Set', 15, 'sets', 18000, 18000, NULL),
('11111111-1111-1111-1111-111111111105', 'Baking Oven — Industrial', 5, 'units', 45000, 55000, 'Commercial grade with warranty'),
('11111111-1111-1111-1111-111111111105', 'Laptop for Digital Literacy', 20, 'units', 25000, 25000, NULL),
('11111111-1111-1111-1111-111111111105', 'Training Materials & Supplies', 1, 'lot', 120000, 120000, NULL),
('11111111-1111-1111-1111-111111111105', 'Venue Rental & Catering', 10, 'days', 15000, 22000, NULL);

-- Project 7: Street Lighting (DELAYED — heavily flagged)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111107', 'Solar LED Street Light 100W', 250, 'units', 8500, 14000, NULL),
('11111111-1111-1111-1111-111111111107', 'Galvanized Steel Pole 6m', 250, 'units', 12000, 18500, NULL),
('11111111-1111-1111-1111-111111111107', 'Lithium Battery Pack 200Ah', 250, 'units', 6000, 9500, NULL),
('11111111-1111-1111-1111-111111111107', 'Installation Labor', 250, 'units', 2500, 2500, NULL),
('11111111-1111-1111-1111-111111111107', 'Concrete Foundation', 250, 'units', 1500, 1500, NULL);

-- Project 8: Water System (Ongoing)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111108', 'Deep Well Pump — Submersible', 1, 'unit', 350000, 350000, NULL),
('11111111-1111-1111-1111-111111111108', 'Elevated Steel Water Tank 20,000L', 1, 'unit', 450000, 580000, NULL),
('11111111-1111-1111-1111-111111111108', 'HDPE Pipe 4"', 3000, 'meters', 280, 280, NULL),
('11111111-1111-1111-1111-111111111108', 'Water Meter', 350, 'units', 1200, 1200, NULL),
('11111111-1111-1111-1111-111111111108', 'Chlorinator System', 1, 'unit', 85000, 85000, NULL);

-- Project 11: Evacuation Center (DELAYED — flagged)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111111', 'Structural Steel I-Beam', 200, 'pcs', 8500, 12500, NULL),
('11111111-1111-1111-1111-111111111111', 'Pre-fab Wall Panels', 150, 'pcs', 3200, 4800, NULL),
('11111111-1111-1111-1111-111111111111', 'Generator — 50KVA Diesel', 1, 'unit', 650000, 850000, 'Typhoon-rated weatherproof enclosure included'),
('11111111-1111-1111-1111-111111111111', 'Emergency Water Storage 10,000L', 2, 'units', 45000, 45000, NULL),
('11111111-1111-1111-1111-111111111111', 'Emergency Lighting Kit', 20, 'sets', 12000, 12000, NULL);

-- Project 15: Solar Power (Completed)
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111115', 'Solar Panel 400W Monocrystalline', 50, 'units', 12000, 12000, NULL),
('11111111-1111-1111-1111-111111111115', 'Inverter 3KW Hybrid', 50, 'units', 18000, 18000, NULL),
('11111111-1111-1111-1111-111111111115', 'Battery LiFePO4 100Ah', 50, 'units', 15000, 15000, NULL),
('11111111-1111-1111-1111-111111111115', 'Mounting Frame & Wiring', 50, 'sets', 5000, 5000, NULL),
('11111111-1111-1111-1111-111111111115', 'Installation & Training', 50, 'households', 3000, 3000, NULL);

-- ============================================================
-- CITIZEN REPORTS (realistic community feedback)
-- ============================================================
INSERT INTO citizen_reports (project_id, citizen_name, comment, created_at) VALUES
('11111111-1111-1111-1111-111111111102', 'Maria Santos', 'The road project in Hilamonan has been stalled for 3 months na. Wala pa may nag-work since December. Kanino tayo mag-reklamo?', '2025-03-15'),
('11111111-1111-1111-1111-111111111102', 'Anonymous', 'Gravel and sand prices listed here seem too high compared sa hardware store sa Kabankalan proper. Please investigate.', '2025-04-02'),
('11111111-1111-1111-1111-111111111107', 'Juan Dela Cruz', 'The street lights sa Poblacion were supposed to be installed last year pa. Dami na aksidente sa gabi dahil madilim pa rin.', '2025-01-20'),
('11111111-1111-1111-1111-111111111107', 'Councilor Reyes (Concerned Citizen)', 'Solar LED units are listed at ₱14,000 each but I checked 3 suppliers — the SRP is around ₱8,500-₱9,000. This needs explanation.', '2025-02-10'),
('11111111-1111-1111-1111-111111111104', 'Pedro Villanueva', 'Flood gate prices at ₱1.2M each seems very high. Regular flood gates cost around ₱800K-₱900K. Any justification?', '2025-05-01'),
('11111111-1111-1111-1111-111111111111', 'Brgy. Captain — Tapi', 'Materials for the evacuation center have not been delivered despite full payment sa supplier. Project is already 6 months delayed.', '2025-06-10'),
('11111111-1111-1111-1111-111111111105', 'SK Chair Elena', 'Salamat sa livelihood program! Naka-start na ang mga youth sa welding business nila. Very helpful.', '2025-01-05'),
('11111111-1111-1111-1111-111111111103', 'Teacher Minda', 'IT Lab is working great! Students are now learning basic programming. Thank you SP!', '2025-02-20'),
('11111111-1111-1111-1111-111111111111', 'Anonymous', 'Pre-fab wall panels declared at ₱4,800 each — but sa supplier website, ₱3,200 lang. May patong ba?', '2025-07-01'),
('11111111-1111-1111-1111-111111111108', 'Kagawad Torres — Binicuil', 'Water system installation is going well. Salamat sa city government. Sana lang on-time ang completion.', '2025-04-15');

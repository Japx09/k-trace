-- ============================================================
-- K-TRACE: Kabankalan City — Highly Realistic Implementation Data
-- ============================================================

-- Step 1: Ensure Status constraint is updated
ALTER TABLE projects DROP CONSTRAINT IF EXISTS projects_status_check;
ALTER TABLE projects ADD CONSTRAINT projects_status_check
  CHECK (status IN ('Pending', 'Ongoing', 'Completed', 'Delayed'));

-- Step 2: Clear existing data safely
DELETE FROM citizen_verifications;
DELETE FROM citizen_reports;
DELETE FROM budget_items;
DELETE FROM projects;

-- ============================================================
-- 1. INFRASTRUCTURE: Road Concreting (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111101',
  'Concreting of Farm-to-Market Road (Phase 2)',
  'Portland Cement Concrete Pavement (PCCP) covering 1.5 kilometers with 0.20m thickness to support agricultural transport.',
  'City Engineering Office / Brgy. Orong', 12450500.75, 'Sitio Buli to Proper, Brgy. Orong', 9.991200, 122.821100, 'Negros Builders Depot', '2025-01-05', 'Ongoing', '2025-01-10');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111101', 'Portland Cement (40kg/bag)', 8500, 'bags', 225.00, 245.00, 'Supplier: Negros Builders Depot'),
('11111111-1111-1111-1111-111111111101', 'Washed Sand', 1200, 'cu.m', 900.00, 950.00, 'Supplier: Kabankalan Aggregates Corp.'),
('11111111-1111-1111-1111-111111111101', 'Gravel (3/4 inch)', 2100, 'cu.m', 1100.00, 1150.00, 'Supplier: Kabankalan Aggregates Corp.'),
('11111111-1111-1111-1111-111111111101', 'Deformed Steel Bars (12mm x 6m)', 4500, 'pcs', 185.00, 210.00, 'Supplier: Southern Steel Supply'),
('11111111-1111-1111-1111-111111111101', 'Heavy Equipment Rental (Payloader/Grader)', 1, 'lot', 1500000.00, 1500000.00, 'Rented from City Motorpool');

-- ============================================================
-- 2. HEALTHCARE: Medical Supplies Procurement (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111102',
  'Procurement of Essential Medicines and Medical Supplies',
  'Quarterly bulk procurement of generic medicines for distribution to 32 Barangay Health Stations.',
  'City Health Office', 3875200.00, 'City Health Office', 9.985500, 122.812200, 'PharmaLink Distributors Inc.', '2024-10-15', 'Completed', '2024-11-05');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111102', 'Amoxicillin 500mg capsules (Box of 100)', 500, 'boxes', 150.00, 215.50, 'Supplier: PharmaLink Distributors Inc.'),
('11111111-1111-1111-1111-111111111102', 'Losartan 50mg tablets (Box of 100)', 800, 'boxes', 280.00, 350.00, 'Supplier: Visayas Medical Supply'),
('11111111-1111-1111-1111-111111111102', 'Paracetamol 500mg tablets (Box of 100)', 1500, 'boxes', 85.00, 95.00, 'Supplier: PharmaLink Distributors Inc.'),
('11111111-1111-1111-1111-111111111102', 'Digital Blood Pressure Apparatus', 64, 'units', 1500.00, 1800.00, '2 units per BHS'),
('11111111-1111-1111-1111-111111111102', 'Thermal Scanner', 100, 'units', 800.00, 1100.00, 'Supplier: Visayas Medical Supply');

-- ============================================================
-- 3. EDUCATION/SK: Laptops for Public Schools (Delayed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111103',
  'Digital Education Initiative: ICT Equipment',
  'Procurement of laptops, smart TVs, and networking peripherals for Senior High School public teachers.',
  'Sangguniang Kabataan Federation', 5250000.00, 'Kabankalan National High School', 9.976600, 122.809000, 'TechVision Solutions Bacolod', '2024-09-01', 'Delayed', '2024-09-15');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111103', 'Mid-range Laptops (Core i5, 8GB RAM, 512GB SSD)', 120, 'units', 35000.00, 38500.00, 'Supplier: TechVision Solutions Bacolod'),
('11111111-1111-1111-1111-111111111103', 'Smart LED TV 55-inch (For Classrooms)', 20, 'units', 22000.00, 25000.00, 'Supplier: Emcor Kabankalan'),
('11111111-1111-1111-1111-111111111103', 'Heavy Duty Printers (Continuous Ink)', 30, 'units', 9500.00, 11000.00, 'Supplier: TechVision Solutions Bacolod'),
('11111111-1111-1111-1111-111111111103', 'Bond Paper A4 (Substance 20)', 500, 'reams', 180.00, 220.00, 'Supplier: Kabankalan Commercial');

-- ============================================================
-- 4. AGRICULTURE: Fertilizer Subsidy (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111104',
  'Fertilizer Subsidy for Registered Rice Farmers',
  'Distribution of Urea and Complete Fertilizers to 1,500 registered farmers under the RSBSA.',
  'City Agriculture Office', 4850000.00, 'City Agriculture Compound', 9.988000, 122.825000, 'Negros Agri-Chem Traders', '2024-09-20', 'Completed', '2024-10-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111104', 'Urea Fertilizer (46-0-0) - 50kg', 1500, 'bags', 1600.00, 1850.00, 'Supplier: Negros Agri-Chem Traders'),
('11111111-1111-1111-1111-111111111104', 'Complete Fertilizer (14-14-14) - 50kg', 800, 'bags', 1400.00, 1550.00, 'Supplier: Planters Choice Agri-Supply'),
('11111111-1111-1111-1111-111111111104', 'Certified Rice Seeds (NSIC Rc 222)', 500, 'bags', 1200.00, 1200.00, 'Subsidized by DA Regional Office');

-- ============================================================
-- 5. BARANGAY: Multi-Purpose Hall (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111105',
  'Rehabilitation of Multi-Purpose Gym',
  'Reroofing, repainting, and installation of new LED lighting fixtures.',
  'Barangay Binicuil', 1200500.00, 'Brgy. Binicuil', 10.010200, 122.795000, 'Southern Steel Supply', '2025-01-20', 'Ongoing', '2025-02-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111105', 'Prepainted Corrugated Roofing Sheets (0.5mm)', 450, 'l.m.', 350.00, 385.00, 'Supplier: Southern Steel Supply'),
('11111111-1111-1111-1111-111111111105', 'C-Purlins (2x3 inches, 1.5mm thick)', 120, 'pcs', 550.00, 620.00, 'Supplier: Negros Builders Depot'),
('11111111-1111-1111-1111-111111111105', 'High Bay LED Lights (150W)', 12, 'units', 4500.00, 5200.00, 'Supplier: EcoTech Lighting PH'),
('11111111-1111-1111-1111-111111111105', 'Boysen Elastomeric Paint (White)', 25, 'pails', 2800.00, 3100.00, 'Supplier: Kabankalan Paint Center');

-- ============================================================
-- 6. RENEWABLE ENERGY: Solar Streetlights (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111106',
  'Installation of Solar-Powered Streetlights',
  'Procurement and installation of 150 units of 100W integrated solar streetlights for off-grid barangay roads.',
  'City Engineering / Brgy. Salong', 3750000.00, 'Brgy. Salong', 9.965000, 122.780000, 'EcoTech Lighting PH', '2024-07-15', 'Completed', '2024-08-10');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111106', 'Integrated Solar Streetlight (100W)', 150, 'units', 22500.00, 25000.00, 'Supplier: EcoTech Lighting PH'),
('11111111-1111-1111-1111-111111111106', 'Galvanized Iron (GI) Posts (20ft, 3-inch dia)', 150, 'pcs', 4200.00, 4800.00, 'Supplier: Southern Steel Supply'),
('11111111-1111-1111-1111-111111111106', 'Portland Cement (For Post Foundations)', 300, 'bags', 225.00, 245.00, 'Supplier: Negros Builders Depot');

-- ============================================================
-- 7. DISASTER RISK MGMT: Evacuation Center (Pending)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111107',
  'Construction of Regional Evacuation Center',
  'A multi-story facility with complete sanitation stations, command center, and stockrooms for disaster preparedness.',
  'DRRMO / DPWH', 35000000.00, 'Brgy. Tapi', 9.950000, 122.850000, 'Kabankalan Ready-Mix', '2025-03-10', 'Pending', '2025-04-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111107', 'Initial Structural Steel Materials', 1, 'lot', 8500000.00, 8500000.00, 'Under Bidding Process'),
('11111111-1111-1111-1111-111111111107', 'Ready-Mix Concrete (3500 psi)', 850, 'cu.m', 4500.00, 4500.00, 'Quotation: Kabankalan Ready-Mix'),
('11111111-1111-1111-1111-111111111107', 'Heavy Duty Generators (100kVA)', 2, 'units', 850000.00, 920000.00, 'Supplier: PowerGen Visayas');

-- ============================================================
-- 8. WATER SERVICES: Upgrading Water System (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111108',
  'Level III Water System Upgrading',
  'Installation of main distribution lines and tapping of new water source to supply 500 households.',
  'Waterworks Department', 8500000.00, 'Brgy. Bantayan', 10.020000, 122.800000, 'Visayas Pipe Manufacturers', '2024-11-01', 'Ongoing', '2024-11-20');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111108', 'HDPE Pipes (6 inches, SDR 11)', 250, 'rolls', 12500.00, 13200.00, 'Supplier: Visayas Pipe Manufacturers'),
('11111111-1111-1111-1111-111111111108', 'Water Meters (Brass, 1/2 inch)', 500, 'units', 1200.00, 1450.00, 'Supplier: AquaTech Solutions'),
('11111111-1111-1111-1111-111111111108', 'Submersible Pump (15 HP)', 2, 'units', 185000.00, 210000.00, 'Supplier: Industrial Pump Depot');

-- ============================================================
-- 9. EMERGENCY RESPONSE: Rescue Vehicles (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111109',
  'Procurement of 4x4 Rescue Vehicles',
  'Purchase of 3 fully-equipped 4x4 rescue pickup trucks with winches and medical trauma kits.',
  'DRRMO', 6900000.00, 'City Hall Compound', 9.981800, 122.815700, 'Southern Motors Corp.', '2024-04-20', 'Completed', '2024-05-12');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111109', '4x4 Pickup Truck (Customized with Canopy)', 3, 'units', 2100000.00, 2300000.00, 'Supplier: Southern Motors Corp.'),
('11111111-1111-1111-1111-111111111109', 'Heavy Duty Winch (12,000 lbs)', 3, 'units', 45000.00, 52000.00, 'Supplier: Off-Road Accessories PH'),
('11111111-1111-1111-1111-111111111109', 'Comprehensive Trauma and First Aid Kit', 3, 'sets', 25000.00, 28500.00, 'Supplier: Visayas Medical Supply');

-- ============================================================
-- 10. INFRASTRUCTURE: Drainage System (Delayed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111110',
  'Flood Control and Drainage Improvement',
  'Excavation and installation of reinforced concrete pipes to address flash floods during rainy season.',
  'City Engineering Office', 15200000.00, 'Brgy. Magballo', 9.960000, 122.820000, 'XYZ Heavy Equipment', '2023-10-15', 'Delayed', '2023-11-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111110', 'Reinforced Concrete Pipes (36-inch dia)', 800, 'pcs', 4500.00, 4800.00, 'Supplier: Negros Builders Depot'),
('11111111-1111-1111-1111-111111111110', 'Backhoe Excavator Rental', 300, 'hours', 1800.00, 2200.00, 'Contractor: XYZ Heavy Equipment'),
('11111111-1111-1111-1111-111111111110', 'Steel Grates for Catch Basins', 45, 'pcs', 3200.00, 3750.00, 'Supplier: Southern Steel Supply');

-- ============================================================
-- 11. BARANGAY: Patrol Vehicles (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111111',
  'Procurement of Barangay Patrol Tricycles',
  'Procurement of 5 multi-purpose tricycles for barangay tanod night patrols and emergency transport.',
  'Barangay Tabugon', 850000.00, 'Brgy. Tabugon', 10.005000, 122.785000, 'Kabankalan Motor Hub', '2024-03-01', 'Completed', '2024-03-25');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111111', '155cc Motorcycle with Custom Sidecar', 5, 'units', 150000.00, 170000.00, 'Supplier: Kabankalan Motor Hub'),
('11111111-1111-1111-1111-111111111111', 'LED Blinkers and Sirens', 5, 'sets', 4500.00, 5200.00, 'Supplier: Auto Access PH'),
('11111111-1111-1111-1111-111111111111', 'Handheld Two-Way Radios', 15, 'units', 2500.00, 3100.00, 'Supplier: CommTech Visayas');

-- ============================================================
-- 12. ECONOMIC: Public Market Rehab (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, lat, lng, contractor_name, award_date, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111112',
  'Rehabilitation of Wet Market Section',
  'Tiling of meat/fish stalls, upgrading of drainage, and installation of proper ventilation systems.',
  'Economic Enterprise Dept.', 4100000.00, 'Kabankalan Public Market, Brgy. Poblacion', 9.982500, 122.816000, 'Ceramica Negrense', '2025-01-10', 'Ongoing', '2025-01-20');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111112', 'Non-Slip Ceramic Tiles (60x60cm)', 1200, 'pcs', 180.00, 210.00, 'Supplier: Ceramica Negrense'),
('11111111-1111-1111-1111-111111111112', 'Tile Adhesive (25kg)', 250, 'bags', 280.00, 320.00, 'Supplier: Negros Builders Depot'),
('11111111-1111-1111-1111-111111111112', 'Industrial Exhaust Fans (24-inch)', 15, 'units', 8500.00, 9800.00, 'Supplier: EcoTech Lighting PH'),
('11111111-1111-1111-1111-111111111112', 'Stainless Steel Meat Counters', 30, 'units', 25000.00, 28500.00, 'Supplier: Visayas Stainless Works');

-- ============================================================
-- CITIZEN REPORTS
-- ============================================================
INSERT INTO citizen_reports (id, project_id, citizen_name, comment, proof_image_url) VALUES
('22222222-2222-2222-2222-222222222201', '11111111-1111-1111-1111-111111111101', 'Concerned Citizen', 'Ang price ng semento diri sa Kabankalan is around 220-230 lang per bag, ngaa sa budget 245 pesos? Dako ang patong.', NULL),
('22222222-2222-2222-2222-222222222202', '11111111-1111-1111-1111-111111111103', 'DepEd Teacher', 'Sabi sa status "Delayed" pero ang laptops na ito ay last year pa na budgetan. Wala pa kaming natatanggap.', NULL),
('22222222-2222-2222-2222-222222222203', '11111111-1111-1111-1111-111111111110', 'Juan Dela Cruz', 'Matagal nang nakatiwangwang ang drainage dito, tag-ulan na ulit wala pading movement!', NULL);

-- ============================================================
-- CITIZEN VERIFICATIONS (Upvotes)
-- ============================================================
INSERT INTO citizen_verifications (id, project_id, citizen_name, comment, proof_image_url) VALUES
('33333333-3333-3333-3333-333333333301', '11111111-1111-1111-1111-111111111102', 'Health Worker', 'Medicines arrived on time and complete inventory as listed.', NULL),
('33333333-3333-3333-3333-333333333302', '11111111-1111-1111-1111-111111111104', 'Farmer Kiko', 'Salamat sa LGU, nakuha na namon ang abono. Dako nga bulig para sa amon pananum.', NULL),
('33333333-3333-3333-3333-333333333303', '11111111-1111-1111-1111-111111111109', 'Volunteer Rescuer', 'New vehicles are highly equipped. Excellent quality for emergency responses.', NULL);

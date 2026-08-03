-- ============================================================
-- K-TRACE: Kabankalan City — Highly Realistic Implementation Data
-- ============================================================

-- Step 1: Ensure Status constraint is updated
ALTER TABLE projects DROP CONSTRAINT IF EXISTS projects_status_check;
ALTER TABLE projects ADD CONSTRAINT projects_status_check
  CHECK (status IN ('Pending', 'Ongoing', 'Completed', 'Delayed'));

-- Step 2: Clear existing data safely
DELETE FROM citizen_reports;
DELETE FROM budget_items;
DELETE FROM projects;

-- ============================================================
-- 1. INFRASTRUCTURE: Road Concreting (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111101',
  'Concreting of Farm-to-Market Road (Phase 2)',
  'Portland Cement Concrete Pavement (PCCP) covering 1.5 kilometers with 0.20m thickness to support agricultural transport.',
  'City Engineering Office / Brgy. Orong', 12450500.75, 'Sitio Buli to Proper, Brgy. Orong', 'Ongoing', '2025-01-10');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111101', 'Portland Cement (40kg/bag)', 8500, 'bags', 225.00, 245.00, 'Supplier: Negros Builders Depot'),
('11111111-1111-1111-1111-111111111101', 'Washed Sand', 1200, 'cu.m', 900.00, 950.00, 'Supplier: Kabankalan Aggregates Corp.');

-- ============================================================
-- 2. HEALTHCARE: Medical Supplies Procurement (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111102',
  'Procurement of Essential Medicines and Medical Supplies',
  'Quarterly bulk procurement of generic medicines for distribution to 32 Barangay Health Stations.',
  'City Health Office', 3875200.00, 'City Health Office', 'Completed', '2024-11-05');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111102', 'Amoxicillin 500mg capsules (Box of 100)', 500, 'boxes', 150.00, 215.50, 'Supplier: PharmaLink Distributors Inc.'),
('11111111-1111-1111-1111-111111111102', 'Losartan 50mg tablets (Box of 100)', 800, 'boxes', 280.00, 350.00, 'Supplier: Visayas Medical Supply');

-- ============================================================
-- 3. EDUCATION/SK: Laptops for Public Schools (Delayed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111103',
  'Digital Education Initiative: ICT Equipment',
  'Procurement of laptops, smart TVs, and networking peripherals for Senior High School public teachers.',
  'Sangguniang Kabataan Federation', 5250000.00, 'Kabankalan National High School', 'Delayed', '2024-09-15');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111103', 'Mid-range Laptops (Core i5, 8GB RAM, 512GB SSD)', 120, 'units', 35000.00, 38500.00, 'Supplier: TechVision Solutions Bacolod');

-- ============================================================
-- 4. AGRICULTURE: Fertilizer Subsidy (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111104',
  'Fertilizer Subsidy for Registered Rice Farmers',
  'Distribution of Urea and Complete Fertilizers to 1,500 registered farmers under the RSBSA.',
  'City Agriculture Office', 4850000.00, 'City Agriculture Compound', 'Completed', '2024-10-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111104', 'Urea Fertilizer (46-0-0) - 50kg', 1500, 'bags', 1600.00, 1850.00, 'Supplier: Negros Agri-Chem Traders');

-- ============================================================
-- 5. BARANGAY: Multi-Purpose Hall (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111105',
  'Rehabilitation of Multi-Purpose Gym',
  'Reroofing, repainting, and installation of new LED lighting fixtures.',
  'Barangay Binicuil', 1200500.00, 'Brgy. Binicuil', 'Ongoing', '2025-02-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111105', 'Prepainted Corrugated Roofing Sheets (0.5mm)', 450, 'l.m.', 350.00, 385.00, 'Supplier: Southern Steel Supply');

-- ============================================================
-- 6. RENEWABLE ENERGY: Solar Streetlights (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111106',
  'Installation of Solar-Powered Streetlights',
  'Procurement and installation of 150 units of 100W integrated solar streetlights for off-grid barangay roads.',
  'City Engineering / Brgy. Salong', 3750000.00, 'Brgy. Salong', 'Completed', '2024-08-10');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111106', 'Integrated Solar Streetlight (100W)', 150, 'units', 22500.00, 25000.00, 'Supplier: EcoTech Lighting PH');

-- ============================================================
-- 7. DISASTER RISK MGMT: Evacuation Center (Pending)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111107',
  'Construction of Regional Evacuation Center',
  'A multi-story facility with complete sanitation stations, command center, and stockrooms for disaster preparedness.',
  'DRRMO / DPWH', 35000000.00, 'Brgy. Tapi', 'Pending', '2025-04-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111107', 'Initial Structural Steel Materials', 1, 'lot', 8500000.00, 8500000.00, 'Under Bidding Process');

-- ============================================================
-- 8. WATER SERVICES: Upgrading Water System (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111108',
  'Level III Water System Upgrading',
  'Installation of main distribution lines and tapping of new water source to supply 500 households.',
  'Waterworks Department', 8500000.00, 'Brgy. Bantayan', 'Ongoing', '2024-11-20');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111108', 'HDPE Pipes (6 inches)', 250, 'rolls', 12500.00, 13200.00, 'Supplier: Visayas Pipe Manufacturers');

-- ============================================================
-- 9. EMERGENCY RESPONSE: Rescue Vehicles (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111109',
  'Procurement of 4x4 Rescue Vehicles',
  'Purchase of 3 fully-equipped 4x4 rescue pickup trucks with winches and medical trauma kits.',
  'DRRMO', 6900000.00, 'City Hall Compound', 'Completed', '2024-05-12');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111109', '4x4 Pickup Truck (Customized)', 3, 'units', 2100000.00, 2300000.00, 'Supplier: Southern Motors Corp.');

-- ============================================================
-- 10. INFRASTRUCTURE: Drainage System (Delayed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111110',
  'Flood Control and Drainage Improvement',
  'Excavation and installation of reinforced concrete pipes to address flash floods during rainy season.',
  'City Engineering Office', 15200000.00, 'Brgy. Magballo', 'Delayed', '2023-11-01');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111110', 'Reinforced Concrete Pipes (36-inch)', 800, 'pcs', 4500.00, 4500.00, 'Supplier: Negros Builders Depot');

-- ============================================================
-- 11. BARANGAY: Patrol Vehicles (Completed)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111111',
  'Procurement of Barangay Patrol Tricycles',
  'Procurement of 5 multi-purpose tricycles for barangay tanod night patrols and emergency transport.',
  'Barangay Tabugon', 850000.00, 'Brgy. Tabugon', 'Completed', '2024-03-25');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111111', '155cc Motorcycle with Custom Sidecar', 5, 'units', 150000.00, 170000.00, 'Supplier: Kabankalan Motor Hub');

-- ============================================================
-- 12. ECONOMIC: Public Market Rehab (Ongoing)
-- ============================================================
INSERT INTO projects (id, title, description, department, total_budget, location, status, created_at)
VALUES ('11111111-1111-1111-1111-111111111112',
  'Rehabilitation of Wet Market Section',
  'Tiling of meat/fish stalls, upgrading of drainage, and installation of proper ventilation systems.',
  'Economic Enterprise Dept.', 4100000.00, 'Kabankalan Public Market, Brgy. Poblacion', 'Ongoing', '2025-01-20');

INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
('11111111-1111-1111-1111-111111111112', 'Non-Slip Ceramic Tiles (60x60cm)', 1200, 'pcs', 180.00, 210.00, 'Supplier: Ceramica Negrense');


-- ============================================================
-- CITIZEN REPORTS
-- ============================================================
INSERT INTO citizen_reports (id, project_id, citizen_name, comment, proof_image_url) VALUES
('22222222-2222-2222-2222-222222222201', '11111111-1111-1111-1111-111111111101', 'Concerned Citizen', 'Ang price ng semento diri sa Kabankalan is around 220-230 lang per bag, ngaa sa budget 245 pesos? Dako ang patong.', NULL),
('22222222-2222-2222-2222-222222222202', '11111111-1111-1111-1111-111111111103', 'DepEd Teacher', 'Sabi sa status "Delayed" pero ang laptops na ito ay last year pa na budgetan. Wala pa kaming natatanggap.', NULL),
('22222222-2222-2222-2222-222222222203', '11111111-1111-1111-1111-111111111110', 'Juan Dela Cruz', 'Matagal nang nakatiwangwang ang drainage dito, tag-ulan na ulit wala pading movement!', NULL);

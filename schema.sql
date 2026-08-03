-- ============================================================
-- K-TRACE: Kabankalan Transparency & Citizen Engagement
-- Supabase Database Schema
-- ============================================================
-- Run this SQL in the Supabase SQL Editor (Dashboard > SQL Editor)
-- ============================================================

-- 1. PROJECTS TABLE
-- Stores all government projects with status tracking
CREATE TABLE IF NOT EXISTS projects (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  department TEXT NOT NULL,
  total_budget NUMERIC(14, 2) NOT NULL DEFAULT 0,
  location TEXT,
  status TEXT NOT NULL DEFAULT 'Pending'
    CHECK (status IN ('Pending', 'Ongoing', 'Completed')),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. BUDGET ITEMS TABLE
-- Itemized Bill of Materials for each project.
-- Each item is compared against the Standard Retail Price (SRP).
CREATE TABLE IF NOT EXISTS budget_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  item_name TEXT NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  unit TEXT DEFAULT 'pc',
  srp_price NUMERIC(12, 2) NOT NULL DEFAULT 0,
  declared_price NUMERIC(12, 2) NOT NULL DEFAULT 0,
  justification TEXT,
  receipt_url TEXT,
  proof_image_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. CITIZEN REPORTS TABLE
-- Public reports for mismatches, concerns, and citizen audits.
CREATE TABLE IF NOT EXISTS citizen_reports (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  citizen_name TEXT NOT NULL DEFAULT 'Anonymous',
  comment TEXT NOT NULL,
  proof_image_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================================
-- INDEXES for fast lookups
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_budget_items_project_id ON budget_items(project_id);
CREATE INDEX IF NOT EXISTS idx_citizen_reports_project_id ON citizen_reports(project_id);
CREATE INDEX IF NOT EXISTS idx_projects_status ON projects(status);

-- ============================================================
-- ROW LEVEL SECURITY (RLS) — Public Read Access
-- ============================================================

-- Enable RLS on all tables
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE budget_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE citizen_reports ENABLE ROW LEVEL SECURITY;

-- Public read access policies
CREATE POLICY "Allow public read access on projects"
  ON projects FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on budget_items"
  ON budget_items FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on citizen_reports"
  ON citizen_reports FOR SELECT
  USING (true);

-- Allow anonymous inserts on citizen_reports (for public submissions)
CREATE POLICY "Allow public insert on citizen_reports"
  ON citizen_reports FOR INSERT
  WITH CHECK (true);

-- ============================================================
-- SEED DATA — Sample projects for testing
-- ============================================================

-- Sample Projects
INSERT INTO projects (id, title, description, department, total_budget, location, status) VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890',
   'Barangay Health Center Construction',
   'Construction of a two-story barangay health center with 6 consultation rooms, a pharmacy area, and emergency response unit in Barangay Camingawan.',
   'Department of Health',
   2850000.00,
   'Brgy. Camingawan, Kabankalan City',
   'Ongoing'),

  ('b2c3d4e5-f6a7-8901-bcde-f12345678901',
   'Farm-to-Market Road Improvement',
   'Rehabilitation and concreting of the 3.2km farm-to-market road connecting Barangay Tan-awan to the city proper, including drainage and shoulder improvements.',
   'Department of Public Works',
   4200000.00,
   'Brgy. Tan-awan, Kabankalan City',
   'Pending'),

  ('c3d4e5f6-a7b8-9012-cdef-123456789012',
   'Public School IT Lab Equipment',
   'Procurement of 30 desktop computers, networking equipment, and software licenses for the Kabankalan National High School IT laboratory.',
   'Department of Education',
   1500000.00,
   'Kabankalan National High School',
   'Completed'),

  ('d4e5f6a7-b8c9-0123-defa-234567890123',
   'Flood Control & Drainage System',
   'Installation of a comprehensive drainage system along Rizal Avenue to mitigate flooding during typhoon season, including 850 meters of reinforced concrete pipes.',
   'City Engineering Office',
   6100000.00,
   'Rizal Ave., Kabankalan City',
   'Ongoing'),

  ('e5f6a7b8-c9d0-1234-efab-345678901234',
   'Senior Citizens Livelihood Program',
   'Distribution of livelihood starter kits (sewing machines, cooking equipment, and raw materials) to 150 senior citizens across 12 barangays.',
   'Office of Senior Citizens Affairs',
   750000.00,
   'City-wide, Kabankalan City',
   'Completed');

-- Sample Budget Items for Project 1: Health Center
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Portland Cement (40kg)', 450, 'bag', 265.00, 265.00, NULL),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Deformed Steel Bar 10mm', 800, 'pc', 185.00, 245.00, 'Supplier price includes delivery to remote barangay site (15km from city proper). Transport cost embedded per unit.'),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Hollow Blocks 4"', 5000, 'pc', 14.00, 14.50, NULL),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Plywood Marine 3/4"', 120, 'sheet', 850.00, 1250.00, 'Marine-grade plywood sourced from Cebu due to local shortage. Includes inter-island freight charges.'),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'GI Roof Sheet 12ft', 200, 'sheet', 620.00, 620.00, NULL),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'PVC Pipe 4" (3m)', 80, 'pc', 380.00, 380.00, NULL),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Electrical Wire TW 12/2 (150m)', 10, 'roll', 4200.00, 5800.00, 'PHILFLEX brand specified by electrical engineer for compliance with PEC. Premium over generic brand.'),
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'LED Panel Light 18W', 45, 'pc', 350.00, 350.00, NULL);

-- Sample Budget Items for Project 2: Road
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
  ('b2c3d4e5-f6a7-8901-bcde-f12345678901', 'Ready-Mix Concrete (cu.m)', 280, 'cu.m', 4500.00, 4500.00, NULL),
  ('b2c3d4e5-f6a7-8901-bcde-f12345678901', 'Gravel Sub-base', 350, 'cu.m', 950.00, 1400.00, 'Nearest quarry 40km away. Hauling cost for 10-wheeler trucks included per cubic meter.'),
  ('b2c3d4e5-f6a7-8901-bcde-f12345678901', 'Deformed Steel Bar 16mm', 500, 'pc', 520.00, 520.00, NULL),
  ('b2c3d4e5-f6a7-8901-bcde-f12345678901', 'Catch Basin Grating', 12, 'pc', 3800.00, 3800.00, NULL);

-- Sample Budget Items for Project 3: IT Lab
INSERT INTO budget_items (project_id, item_name, quantity, unit, srp_price, declared_price, justification) VALUES
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', 'Desktop Computer (i5, 8GB, 256GB SSD)', 30, 'unit', 32000.00, 38500.00, 'Brand-new units with 3-year on-site warranty from authorized dealer. Includes OS license and setup.'),
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', 'Network Switch 24-port', 2, 'unit', 8500.00, 8500.00, NULL),
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', 'UPS 1000VA', 15, 'unit', 4200.00, 4200.00, NULL),
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', 'CAT6 Cable (305m box)', 3, 'box', 5500.00, 5500.00, NULL),
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', '24" LED Monitor', 30, 'unit', 7500.00, 9200.00, 'IPS panel monitors selected for better color accuracy in graphic design curriculum. Upgraded from TN spec.'),
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', 'Keyboard & Mouse Set', 30, 'set', 650.00, 650.00, NULL);

-- Sample Citizen Reports
INSERT INTO citizen_reports (project_id, citizen_name, comment) VALUES
  ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Juan Dela Cruz', 'The plywood price seems very high compared to what is available locally. I checked three hardware stores in Kabankalan and the highest price is ₱950/sheet, not ₱1,250.'),
  ('c3d4e5f6-a7b8-9012-cdef-123456789012', 'Maria Santos', 'The IT lab is marked as completed but when I visited last week, only 20 computers were set up, not 30 as listed in the budget items.'),
  ('d4e5f6a7-b8c9-0123-defa-234567890123', 'Anonymous', 'Drainage pipe installation on Rizal Ave near the market section appears to use smaller diameter pipes than what is specified in the project documents.');

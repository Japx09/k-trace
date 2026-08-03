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
  lat NUMERIC(10, 6),
  lng NUMERIC(10, 6),
  contractor_name TEXT,
  award_date DATE,
  status TEXT NOT NULL DEFAULT 'Pending'
    CHECK (status IN ('Pending', 'Ongoing', 'Completed', 'Delayed')),
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

-- 4. CITIZEN VERIFICATIONS TABLE
-- Public upvotes / verifications for completed or good projects.
CREATE TABLE IF NOT EXISTS citizen_verifications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  citizen_name TEXT NOT NULL DEFAULT 'Anonymous',
  comment TEXT,
  proof_image_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- ============================================================
-- INDEXES for fast lookups
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_budget_items_project_id ON budget_items(project_id);
CREATE INDEX IF NOT EXISTS idx_citizen_reports_project_id ON citizen_reports(project_id);
CREATE INDEX IF NOT EXISTS idx_citizen_verifications_project_id ON citizen_verifications(project_id);
CREATE INDEX IF NOT EXISTS idx_projects_status ON projects(status);

-- ============================================================
-- ROW LEVEL SECURITY (RLS) — Public Read Access
-- ============================================================

-- Enable RLS on all tables
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE budget_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE citizen_reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE citizen_verifications ENABLE ROW LEVEL SECURITY;

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

CREATE POLICY "Allow public read access on citizen_verifications"
  ON citizen_verifications FOR SELECT
  USING (true);

-- Allow anonymous inserts on citizen_reports & verifications (for public submissions)
CREATE POLICY "Allow public insert on citizen_reports"
  ON citizen_reports FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Allow public insert on citizen_verifications"
  ON citizen_verifications FOR INSERT
  WITH CHECK (true);

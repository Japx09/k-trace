export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(200).end();

  const SUPABASE_URL = process.env.SUPABASE_URL;
  const SUPABASE_KEY = process.env.SUPABASE_SERVICE_KEY;

  if (!SUPABASE_URL || !SUPABASE_KEY) {
    return res.status(500).json({ error: 'Server misconfigured' });
  }

  try {
    const { project_id } = req.query;

    // GET — fetch reports and verifications
    if (req.method === 'GET') {
      if (!project_id) {
        return res.status(400).json({ error: 'project_id is required' });
      }

      const [reportsRes, verificationsRes] = await Promise.all([
        fetch(`${SUPABASE_URL}/rest/v1/citizen_reports?select=*&project_id=eq.${project_id}&order=created_at.desc`, {
          headers: { 'apikey': SUPABASE_KEY, 'Authorization': 'Bearer ' + SUPABASE_KEY }
        }),
        fetch(`${SUPABASE_URL}/rest/v1/citizen_verifications?select=*&project_id=eq.${project_id}&order=created_at.desc`, {
          headers: { 'apikey': SUPABASE_KEY, 'Authorization': 'Bearer ' + SUPABASE_KEY }
        })
      ]);

      const reports = reportsRes.ok ? await reportsRes.json() : [];
      const verifications = verificationsRes.ok ? await verificationsRes.json() : [];

      return res.status(200).json({ reports, verifications });
    }

    // POST — submit a new report or verification
    if (req.method === 'POST') {
      const { type, ...body } = req.body;

      if (!type || !['citizen_reports', 'citizen_verifications'].includes(type)) {
        return res.status(400).json({ error: 'Invalid type. Use citizen_reports or citizen_verifications.' });
      }

      // Basic validation
      if (!body.project_id) {
        return res.status(400).json({ error: 'project_id is required' });
      }

      const response = await fetch(`${SUPABASE_URL}/rest/v1/${type}`, {
        method: 'POST',
        headers: {
          'apikey': SUPABASE_KEY,
          'Authorization': 'Bearer ' + SUPABASE_KEY,
          'Content-Type': 'application/json',
          'Prefer': 'return=minimal'
        },
        body: JSON.stringify(body)
      });

      if (!response.ok) {
        const errText = await response.text();
        return res.status(response.status).json({ error: errText });
      }

      return res.status(201).json({ success: true });
    }

    return res.status(405).json({ error: 'Method not allowed' });
  } catch (err) {
    return res.status(500).json({ error: 'Internal server error' });
  }
}

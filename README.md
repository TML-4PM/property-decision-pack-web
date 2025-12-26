# Property Decision Pack - Static Site

A comprehensive property decision tool for Troy & Cassandra.

## Features

- **12 Options** with full financial details, pros/cons, and risk ratings
- **Split Calculator** with buffer, renovations, and holiday deductions
- **Stress Test** showing runway weeks and hit point analysis
- **Growth Projections** across 3 scenarios (Conservative, Middle, Strong)
- **Question Log** with localStorage persistence and optional Supabase sync
- **Decision Matrix** for scoring options against criteria
- **Email Summary Generator** with clipboard copy and mailto link
- **6 SVG Charts** for visual data presentation

## Files

- `index.html` - Main application (single page)
- `model_data.json` - All financial data and assumptions
- `assets/` - SVG charts

## Deployment

Static site - no build step required.

### Vercel
1. Import from GitHub
2. Framework: Other
3. Build Command: (leave empty)
4. Output Directory: `.`

### Local
```bash
python3 -m http.server 8000
# Open http://localhost:8000
```

## Supabase Sync (Optional)

Create table:
```sql
CREATE TABLE property_question_log (
  id TEXT PRIMARY KEY,
  timestamp TIMESTAMPTZ,
  asked_by TEXT,
  status TEXT,
  revisit DATE,
  question TEXT,
  answer TEXT
);

ALTER TABLE property_question_log ENABLE ROW LEVEL SECURITY;
```

---
*Modelling only, not financial advice.*

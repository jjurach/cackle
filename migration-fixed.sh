#!/bin/bash
set -e

echo "Starting cackle migration..."

# Create safety tag (skip if exists)
git tag -a -m 'pre-dev_notes-cleanup' pre-dev_notes-cleanup 2>/dev/null || echo "Tag already exists"

# Create planning directory structure
mkdir -p planning/inbox planning/inbox-archive planning/analysis

# Move file that was previously moved to tmp back to dev_notes for proper git mv
if [ -f "tmp/2026-01-04_00-00-00_backend_initial_setup.md.untracked" ]; then
  mv tmp/2026-01-04_00-00-00_backend_initial_setup.md.untracked dev_notes/project_plans/2026-01-04_00-00-00_backend_initial_setup.md
fi

# Migrate project_plans
echo "Migrating project_plans..."
for file in dev_notes/project_plans/*.md; do
  if [ -f "$file" ]; then
    basename=$(basename "$file" .md)
    git mv "$file" "planning/${basename}-plan.md" 2>/dev/null || true
  fi
done

# Remove empty directories
echo "Cleaning up..."
rmdir dev_notes/project_plans 2>/dev/null || true
rmdir dev_notes/specs 2>/dev/null || true
rmdir dev_notes/inbox 2>/dev/null || true
rmdir dev_notes/inbox-archive 2>/dev/null || true
rmdir dev_notes/analysis 2>/dev/null || true

echo "✓ Migration complete"

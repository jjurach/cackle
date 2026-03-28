#!/bin/bash
# Auto-generated migration script - REVIEW BEFORE EXECUTION
# Project: cackle

set -e

# Create safety tag before migration
git tag -a -m 'pre-dev_notes-cleanup' pre-dev_notes-cleanup

# Move untracked files to tmp/ for review
mkdir -p tmp
mv dev_notes/project_plans/2026-01-04_00-00-00_backend_initial_setup.md tmp/2026-01-04_00-00-00_backend_initial_setup.md.untracked

# Create planning directory structure
mkdir -p planning/inbox

# Migrate project_plans → planning/*-plan.md
git mv dev_notes/project_plans/2026-01-04_00-00-00_backend_initial_setup.md planning/2026-01-04_00-00-00_backend_initial_setup-plan.md

# Remove empty directories
rmdir dev_notes/specs 2>/dev/null || true
rmdir dev_notes/project_plans 2>/dev/null || true
rmdir dev_notes/inbox 2>/dev/null || true

echo '✓ Migration complete for cackle'
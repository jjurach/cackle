#!/bin/bash
# This script assembles a single prompt file for Gemini by combining
# the core agent instructions and all detailed documentation.

# Set the output file name in the project root
OUTPUT_FILE="GEMINI.md"

# Announce the process
echo "Assembling $OUTPUT_FILE..."

# 1. Start with AGENTS.md
cat AGENTS.md > "$OUTPUT_FILE"

# 2. Add a clear separator
echo -e "\n\n--- DETAILED DOCUMENTATION ---\n" >> "$OUTPUT_FILE"

# 3. Append all files from the docs/ directory
# The 'find' command is used to handle a large number of files gracefully
# and to ensure a consistent order.
find docs -type f -name "*.md" | sort | xargs cat >> "$OUTPUT_FILE"

echo "$OUTPUT_FILE assembled successfully in the project root."

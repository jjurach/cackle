# Documentation Templates

This file contains the full templates to be used for all Project Plans and Change Documentation, as mandated by `AGENTS.md`. Fields marked with **(Optional)** may be omitted if not applicable.

---

## Project Plan Template

**AI AGENT INSTRUCTIONS:** Use this template for ALL Project Plans. Be thorough and specific.

```markdown
# Project Plan: [Project Name]

**Date:** YYYY-MM-DD HH:MM:SS
**Estimated Duration:** [X hours/days] **(Optional)**
**Complexity:** [Low/Medium/High] **(Optional)**
**Status:** [Draft/Approved/In Progress/Completed/Cancelled] **(Optional)**

## Objective
A clear, one-sentence statement of what needs to be accomplished and why.

## Requirements **(Optional)**
A checklist of functional and non-functional requirements that must be met for the project to be considered complete.
- [ ] Requirement 1: ...
- [ ] Requirement 2: ...
- [ ] Requirement 3: ...

## Implementation Steps
A detailed, step-by-step breakdown of the work to be done. Each step should be a small, logical unit of work.
1.  **Step 1:** [Description of the step]
    -   **Files to Modify:** `path/to/file.ext`
    -   **Files to Create:** `path/to/new_file.ext`
    -   **Dependencies:** [List any dependencies for this step] **(Optional)**
    -   **Estimated Time:** [X hours] **(Optional)**
    -   **Status:** [ ] Not Started / [ ] In Progress / [ ] Completed **(Optional)**

2.  **Step 2:** [Description of the step]
    -   ...

## Success Criteria
A measurable, objective checklist to verify that the project's objectives have been met.
- [ ] Criterion 1: The application successfully...
- [ ] Criterion 2: The endpoint returns a 200 OK status...
- [ ] Criterion 3: Unit test coverage is above X%.

## Testing Strategy
How the changes will be tested to ensure quality and prevent regressions.
- [ ] **Unit Tests:** New unit tests will be added for function X and Y.
- [ ] **Integration Tests:** The end-to-end flow from frontend to backend will be tested.
- [ ] **Manual Testing:** Perform manual test case Z on a physical device.

## Risk Assessment
Potential risks and a plan to mitigate them.
- **High Risk:** [Description of risk and mitigation plan.]
- **Medium Risk:** [Description of risk and mitigation plan.]
- **Low Risk:** [Description of risk and mitigation plan.]

## Notes **(Optional)**
Any additional context, assumptions, or future considerations that are relevant to the plan.
```

---

## Change Documentation Template

**AI AGENT INSTRUCTIONS:** Use this template for ALL non-trivial changes. Fill in required sections; optional sections may be omitted if not applicable.

```markdown
# Change: [Brief, Descriptive Title of the Change]

**Date:** YYYY-MM-DD HH:MM:SS
**Type:** [Feature/Enhancement/Bug Fix/Refactor/Documentation] **(Optional)**
**Status:** [Completed] **(Optional)**
**Related Project Plan:** `dev_notes/project_plans/YYYY-MM-DD_HH-MM-SS_project-name.md`

## Overview
A brief description of what was changed and why it was necessary.

## Files Modified
A list of all files that were created or modified as part of this change.
- `path/to/file1.ext` - Description of changes made to this file.
- `path/to/file2.ext` - Description of changes made to this file.

## Code Changes **(Optional)**
For significant or complex changes, include code snippets showing the change.

### Before
```python
# Original code snippet
```

### After
```python
# Modified code snippet
```

## Testing
A summary of the testing that was performed to validate this change.
- [X] Unit tests for function X were updated and are passing.
- [X] Manual testing of the user flow was completed on an Android emulator.

## Impact Assessment
An analysis of the change's potential impact on the broader system.
- **Breaking Changes:** [Yes/No] - If yes, explain what is broken.
- **Dependencies Affected:** [List any other components that rely on this change.]
- **Performance Impact:** [None/Minor/Major] - Explain if applicable.

## Notes **(Optional)**
Any additional context, decisions made during implementation, or considerations for future work.
```

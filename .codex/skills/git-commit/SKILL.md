---
name: git-commit
description: Commit changes to a project with git. Use this skill anytime the user requests for changes to be committed or you are committing changes agentically.
---

# Git Commit

## CRITICAL RULES

**NEVER prefix the subject with a Conventional Commits type.** No `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `style:`, `test:`, `ci:`, `build:`, `perf:`, or any other `type:` prefix. Subjects that start with a type prefix are WRONG. Strip them.

**Always write the commit message to a tempfile** and pass it via `git commit -F <file>`. This avoids shell escaping issues with quotes, backticks, and special characters. Use a timestamped filename in `~/tmp/` (e.g. `~/tmp/commit-msg-$(date +%s%N).txt`) to prevent collisions between concurrent agents. Delete the tempfile after the commit succeeds.

## Subject line

- Imperative mood, capitalized, no trailing period
- Under 50 characters
- No type prefixes (see above)

## Body

- Separated from subject by a blank line
- Wrapped at 72 characters
- Explains WHY and HOW, not just WHAT
- Mark breaking changes with `BREAKING CHANGE:`

## Example

```
Simplify serialize.h's exception handling

As exceptmask always included 'failbit', and setstate was always
called with bits = failbit, all it did was immediately raise an
exception. Get rid of those variables, and replace the setstate
with direct exception throwing (which also removes some dead
code).
```

## Workflow

1. Run `git diff --staged` to review changes
2. Confirm the commit is a single logical unit — split if not
3. Write subject and body
4. Run checklist below before committing

## Checklist

- [ ] Stage files with `git add -p` if needed
- [ ] Subject has **NO** type prefix (`feat:`, `fix:`, etc.)
- [ ] Subject is under 50 chars, imperative, capitalized, no period
- [ ] Body explains why, wrapped at 72 chars
- [ ] Breaking changes marked
- [ ] Related issues referenced

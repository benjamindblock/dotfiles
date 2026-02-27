---
name: git-commit
description: Generate descriptive commit messages by analyzing git diffs. Use when the user asks for help writing commit messages or reviewing staged changes.
---

# Git Commit Helper

## Quick start

Analyze staged changes and generate commit message:

```bash
# View staged changes
git diff --staged

# Generate commit message based on changes
# (Claude will analyze the diff and suggest a message)
```

## Commit message format

Follow the standard format:

```
<subject>

<body>
```

### Example

```
Simplify serialize.h's exception handling

As exceptmask always included 'failbit', and setstate was always
called with bits = failbit, all it did was immediately raise an
exception. Get rid of those variables, and replace the setstate
with direct exception throwing (which also removes some dead
code).

As a result, good() is never reached after a failure (there are
only 2 calls, one of which is in tests), and can just be replaced
by !eof().

fail(), clear(n) and exceptions() are just never called. Delete
them.
```

## Analyzing changes

Review what's being committed:

```bash
# Show files changed
git status

# Show detailed changes
git diff --staged

# Show statistics
git diff --staged --stat

# Show changes for specific file
git diff --staged path/to/file
```

## Breaking changes

Indicate breaking changes clearly:

```
Restructure API response format

BREAKING CHANGE: All API responses now follow JSON:API spec

Previous format:
{ "data": {...}, "status": "ok" }

New format:
{ "data": {...}, "meta": {...} }

Migration guide: Update client code to handle new response structure
```

## Template workflow

1. **Review changes**: `git diff --staged`
2. **Verify logical group**: Confirm that the commit represents a single,
   logical update. Larger updates should be split into several atomic commits
   that can be merged independently.
3. **Write subject**: Brief description
4. **Add body**: Explain why and what impact
5. **Note breaking changes**: If applicable

## Interactive commit helper

Use `git add -p` for selective staging:

```bash
# Stage changes interactively
git add -p

# Review what's staged
git diff --staged

# Commit with message
git commit -m "type(scope): description"
```

## Amending commits

Fix the last commit message:

```bash
# Amend commit message only
git commit --amend

# Amend and add more changes
git add forgotten-file.js
git commit --amend --no-edit
```

## Best practices

1. **Atomic commits** - One logical change per commit
2. **Test before commit** - Ensure code works
3. **Reference issues** - Include issue numbers if applicable
4. **Keep it focused** - Don't mix unrelated changes
5. **Write for humans** - Future you will read this

## Commit message checklist

- [ ] Separate subject from body with a blank line
- [ ] Scope is specific and clear
- [ ] Subject is under 50 characters
- [ ] Subject uses imperative mood
- [ ] Capitalize the subject line
- [ ] Do not end the subject line with a period
- [ ] Body explains WHY and HOW not just WHAT
- [ ] Body is wrapped at 72 characters
- [ ] Breaking changes are clearly marked
- [ ] Related issue numbers are included

## Commit message bad practices

Don't do *any* of the following:
- Use vague messages like "update" or "fix stuff"
- Write paragraphs in the subject
- Use the past tense

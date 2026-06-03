# Personal Claude Preferences

Prefer using bq over hex.

When doing complex agent work, please create and keep updated a file called
CLAUDE_PLAN.md so that future Claudes can understand what you are up to.

## Git Practices

- Commit relatively frequently when you do a chunk of work.
- Do NOT use `git commit --amend` unless explicitly asked
- Do NOT use `git push --force` or `git push --force-with-lease` unless
  explicitly asked
- Create separate commits for each logical change
- Git branches should be prefixed with `jvm/` and, if relevant, a reference to
  a linear ticket like `data-XXX`.
- Often we have multiple claude codes in the same repo. To avoid collisions,
  it's generally best to work within a worktree.
- If you have an open PR, when you make a substantive change update the PR
  description so the description matches the code being PR'd.

## Found specific notes

- dbt repo is deprecated so don't try to use it. dbt is now in the `found` monorepo under data-platform/dbt.

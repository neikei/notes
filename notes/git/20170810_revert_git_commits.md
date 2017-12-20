### 2017-08-10: Revert git commits

Git snippets to revert commits.

```bash
# Desc: Revert the last commit
git revert HEAD

# Desc: Revert a specific commit by commit id
git revert <commit_id>

# Desc: Revert the last merge
git revert -m1 HEAD

# Desc: Revert a specific merge by commit id
git revert -m1 <commit_id>
```

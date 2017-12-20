### 2017-08-10: Revert git commits

Git snippets to revert commits.

```bash
#: Revert the last commit
git revert HEAD

#: Revert a specific commit by commit id
git revert <commit_id>

#: Revert the last merge
git revert -m1 HEAD

#: Revert a specific merge by commit id
git revert -m1 <commit_id>
```

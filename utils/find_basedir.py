#/usr/bin/env python3

from pathlib import Path

def get_git_root(start_path: Path = None) -> Path:
    """
    Return the root directory of the Git repository containing the given path.

    Supports standard and worktree-style .git setups.

    :param start_path: Optional starting path. Defaults to current working directory.
    :return: Path object pointing to the Git repository root.
    :raises FileNotFoundError: If no Git repository is found.
    """
    if start_path is None:
        start_path = Path.cwd()

    start_path = start_path.resolve()

    for parent in [start_path] + list(start_path.parents):
        git_path = parent / ".git"
        if git_path.exists():
            if git_path.is_file():
                # Handle .git as a file (common with worktrees)
                try:
                    content = git_path.read_text().strip()
                    if content.startswith("gitdir:"):
                        git_dir = Path(content.split(":", 1)[1].strip())
                        resolved_git_dir = (git_path.parent / git_dir).resolve()
                        if resolved_git_dir.exists():
                            return parent
                except Exception:
                    continue  # Skip to next parent if .git file is malformed
            else:
                return parent

    raise FileNotFoundError("No Git repository found in this or any parent directory.")

def main():
  root_dir = get_git_root()
  print(root_dir)
if __name__ == "__main__":
  main()

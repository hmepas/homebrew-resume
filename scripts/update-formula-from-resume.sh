#!/bin/sh

set -eu

repo_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
resume_root="$(CDPATH= cd -- "$repo_root/../resume" && pwd)"
source_formula="$resume_root/packaging/homebrew/resume.rb"
target_formula="$repo_root/Formula/resume.rb"

if [ ! -f "$source_formula" ]; then
  echo "source formula not found: $source_formula" >&2
  exit 1
fi

cp "$source_formula" "$target_formula"

cd "$repo_root"
echo "Updated Formula/resume.rb from ../resume/packaging/homebrew/resume.rb"
echo
git diff -- Formula/resume.rb || true
echo
echo "Next:"
echo "  git status --short"
echo "  brew audit --strict --online resume"
echo "  brew test resume"
echo "  git add Formula/resume.rb"
echo "  git commit -m 'Update resume formula to vX.Y.Z'"
echo "  git push"

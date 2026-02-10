#!/bin/bash
# 블로그 변경사항 커밋 및 푸시 스크립트

set -e
cd "$(dirname "$0")"

echo "=== 블로그 배포 ==="
echo ""

# 변경사항 확인
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "변경사항이 없습니다."
  exit 0
fi

echo "변경된 파일:"
git status --short
echo ""

read -p "커밋 메시지를 입력하세요: " MSG

if [ -z "$MSG" ]; then
  echo "커밋 메시지가 비어있습니다."
  exit 1
fi

git add -A
git commit -m "$MSG"

echo ""
read -p "원격에 푸시할까요? (y/n): " PUSH
if [ "$PUSH" = "y" ] || [ "$PUSH" = "Y" ]; then
  git push
  echo ""
  echo "배포 완료! 잠시 후 https://russellgeum.github.io 에서 확인하세요."
else
  echo "커밋만 완료. 나중에 git push로 배포하세요."
fi

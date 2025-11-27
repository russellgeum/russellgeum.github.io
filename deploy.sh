#!/bin/bash

# Hugo 블로그 자동 배포 스크립트
set -e

echo "--- Hugo 블로그 자동 배포를 시작합니다..."

# 1. Hugo로 정적 사이트 생성
echo "--- Hugo 사이트를 빌드하는 중..."
hugo

# 2. public 디렉토리로 이동
cd public

# 3. Git 작업
echo "--- 변경사항을 커밋하는 중..."

# 모든 파일 추가
git add .

# 커밋 메시지 생성 (현재 시간)
commit_msg="Blog update: $(date '+%Y-%m-%d %H:%M:%S')"

# 변경사항이 있는지 확인
if git diff --staged --quiet; then
    echo "--- 배포할 변경사항이 없습니다."
    exit 0
fi

# 커밋
git commit -m "$commit_msg"

# 4. GitHub Pages로 푸시
echo "--- GitHub Pages로 푸시하는 중..."
git push origin master

echo "--- 배포가 완료되었습니다!"
echo "--- 사이트 확인: https://russellgeum.github.io"
#!/bin/bash
# 새 블로그 게시글 생성 스크립트

set -e
cd "$(dirname "$0")"

DATE=$(date +%Y%m%d)

echo "=== 새 게시글 만들기 ==="
echo ""
echo "카테고리를 선택하세요:"
echo "  1) research  (논문 리뷰)"
echo "  2) essay     (생각/에세이)"
echo "  3) technical (기술/개발)"
echo ""
read -p "번호 입력 (1/2/3): " choice

case $choice in
  1) CATEGORY="research" ;;
  2) CATEGORY="essay" ;;
  3) CATEGORY="technical" ;;
  *) echo "잘못된 입력입니다."; exit 1 ;;
esac

FILENAME="${DATE}.md"
FILEPATH="content/${CATEGORY}/${FILENAME}"

if [ -f "$FILEPATH" ]; then
  echo ""
  echo "이미 존재하는 파일입니다: ${FILEPATH}"
  read -p "다른 파일명을 입력하세요 (예: ${DATE}b): " CUSTOM
  FILENAME="${CUSTOM}.md"
  FILEPATH="content/${CATEGORY}/${FILENAME}"
fi

hugo new "${CATEGORY}/${FILENAME}"

echo ""
echo "게시글이 생성되었습니다: ${FILEPATH}"
echo "draft: true 상태이므로, 작성 완료 후 draft 줄을 삭제하거나 false로 바꾸세요."
echo ""
read -p "에디터로 열까요? (y/n): " OPEN
if [ "$OPEN" = "y" ] || [ "$OPEN" = "Y" ]; then
  if command -v code &> /dev/null; then
    code "$FILEPATH"
  elif command -v cursor &> /dev/null; then
    cursor "$FILEPATH"
  else
    open "$FILEPATH"
  fi
fi

# Blog Project Guide

## Overview
- **Framework**: Hugo + PaperMod theme
- **Repository**: https://github.com/russellgeum/russellgeum.github.io.git
- **Deploy**: GitHub Pages (main branch push triggers deploy)
- **Config**: `hugo.yaml`

## Directory Structure
```
content/
  papers/      # 논문 리뷰 (categories: "논문")
  essay/       # 에세이/생각 (categories: "생각")
  dev/         # 기술/개발 (categories: "개발")
static/        # 이미지 등 정적 파일
archetypes/    # 각 카테고리별 템플릿
themes/PaperMod/
```

## File Naming
- 파일명: `YYYYMMDD.md` (예: `20250516.md`)
- 새 글 생성: `hugo new papers/YYYYMMDD.md`

## Front Matter (공통)
```yaml
---
date: YYYY-MM-DD
author: "5biwan"
title: "[카테고리] 제목"
categories: "카테고리명"
weight: 10
---
```

### 카테고리별 title prefix와 categories 값
| 카테고리 | title prefix | categories |
|----------|-------------|------------|
| papers   | `[논문]`    | `"논문"`   |
| essay    | `[생각]`    | `"생각"`   |
| dev      | `[기술]` 또는 `[개발]` | `"개발"` |

## Research 포스트 마크다운 형식 (논문 리뷰)
메인 섹션은 반드시 **H2 (`##`)** 로 작성. 서브섹션은 H3 (`###`) 사용.
front matter 바로 다음에 별도의 논문 제목 heading을 넣지 않는다 (title에 이미 있으므로 중복).

```markdown
## 1. Motivation
(내용)

## 2. Related Work
(내용)

## 3. Proposed Method
(내용, 필요시 ### 서브섹션 사용)

## 4. Experiments
(내용, 필요시 ### 서브섹션 사용)

## 5. Conclusion & Limitation
(내용)

## Key References
(참고 문헌)
```

## Essay 포스트 마크다운 형식
```markdown
## 1. (주제)
(내용)

## 2. (주제)
(내용)
```

## Dev 포스트 마크다운 형식
자유 형식. H2 (`##`)를 메인 섹션으로 사용.

## Images
- 저장 경로: `static/YYYY-MM-DD/` 또는 `static/YYYYMMDD/`
- 마크다운에서 참조: `![설명](/YYYY-MM-DD/파일명.jpg)`

## Local Development
```bash
hugo server -D    # 드래프트 포함 로컬 미리보기 (http://localhost:1313)
hugo              # 빌드 (public/ 생성)
```

## Git Workflow
- main 브랜치에서 직접 작업
- push하면 GitHub Pages에 자동 배포
- 글 작성 완료 시 `draft: true` 제거 또는 `false`로 변경 후 커밋/푸시

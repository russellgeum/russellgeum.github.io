# 5biwan's BLOG

[![Deploy Hugo site to Pages](https://github.com/russellgeum/russellgeum.github.io/actions/workflows/hugo.yml/badge.svg)](https://github.com/russellgeum/russellgeum.github.io/actions/workflows/hugo.yml)

Hugo PaperMod 테마를 사용한 개인 블로그입니다. 자동화된 템플릿 시스템과 배포 프로세스를 통해 효율적인 블로그 운영을 목표로 합니다.

## 🌐 사이트 정보

- **URL**: [https://russellgeum.github.io](https://russellgeum.github.io)
- **테마**: [Hugo PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- **호스팅**: GitHub Pages

## 🚀 빠른 시작

### 1. 새 포스트 작성

```bash
# 에세이 포스트 생성
hugo new --kind=essay content/posts/essay/YYYY-MM-DD-제목.md

# 논문 리뷰 포스트 생성
hugo new --kind=research content/posts/research/YYYY-MM-DD-제목.md

# 기술 블로그 포스트 생성
hugo new --kind=technical content/posts/technical/YYYY-MM-DD-제목.md
```

### 2. 대화형 포스트 생성

```bash
./new-post.sh
```

카테고리, 제목, 날짜를 선택할 수 있는 대화형 스크립트입니다.

### 3. 로컬 미리보기

```bash
hugo server -D
# http://localhost:1313에서 확인
```

### 4. 배포

```bash
./deploy.sh
```

## 📁 프로젝트 구조

```
BLOG/
├── archetypes/          # 포스트 템플릿
│   ├── default.md       # 기본 템플릿
│   ├── essay.md         # 에세이 템플릿
│   ├── research.md      # 논문 리뷰 템플릿
│   └── technical.md     # 기술 블로그 템플릿
├── content/             # 블로그 콘텐츠
│   └── posts/
│       ├── essay/       # 에세이 포스트
│       ├── research/    # 논문 리뷰 포스트
│       └── technical/   # 기술 블로그 포스트
├── layouts/             # 커스텀 레이아웃
│   └── partials/
│       └── extend_head.html  # 커스텀 파비콘 설정
├── static/              # 정적 파일
│   ├── favicon.ico
│   ├── favicon-16x16.png
│   ├── favicon-32x32.png
│   └── apple-touch-icon.png
├── themes/PaperMod/     # Hugo PaperMod 테마
├── deploy.sh            # 자동 배포 스크립트
├── new-post.sh          # 대화형 포스트 생성 스크립트
├── blog-aliases.sh      # 편의 별칭 설정
└── hugo.yaml            # Hugo 설정 파일
```

## 📝 템플릿 시스템

### Essay 템플릿
```yaml
---
date: {{ .Date }}
author: "5biwan"
title: "[생각] {{ replace .Name "-" " " | title }}"
categories: "생각"
weight: 10
draft: true
---

# 1. 요즘 생각

# 2. 요즘 일상
```

### Research 템플릿
```yaml
---
date: {{ .Date }}
author: "5biwan"
title: "[논문] {{ replace .Name "-" " " | title }}"
categories: "논문"
weight: 10
draft: true
---

# Abstract

# Introduction

# Method

# Experiment

# Conclusion
```

### Technical 템플릿
```yaml
---
date: {{ .Date }}
author: "5biwan"
title: "[기술] {{ replace .Name "-" " " | title }}"
categories: "기술"
weight: 10
draft: true
---

# 문제 정의

# 해결 방법

# 구현

# 결과
```

## 🛠️ 편의 기능

### 1. 별칭 설정

```bash
# 별칭 설정 (한 번만 실행)
source blog-aliases.sh

# 사용 가능한 명령어들
blog          # 블로그 디렉토리로 이동
new-essay     # 새 에세이 포스트 생성
new-research  # 새 논문 포스트 생성
new-technical # 새 기술 포스트 생성
new-post      # 대화형 포스트 생성 스크립트
blog-serve    # 로컬 서버 시작
blog-build    # 블로그 빌드
blog-deploy   # 블로그 배포
```

### 2. 자동 배포 스크립트

`deploy.sh` 스크립트는 다음 작업을 자동으로 수행합니다:

1. Hugo로 정적 사이트 생성
2. public 디렉토리로 이동
3. Git 변경사항 커밋
4. GitHub Pages로 푸시

```bash
#!/bin/bash
set -e

echo "--- Hugo 블로그 자동 배포를 시작합니다..."

# 1. Hugo로 정적 사이트 생성
hugo

# 2. public 디렉토리로 이동
cd public

# 3. Git 작업
git add .
commit_msg="Blog update: $(date '+%Y-%m-%d %H:%M:%S')"

if git diff --staged --quiet; then
    echo "--- 배포할 변경사항이 없습니다."
    exit 0
fi

git commit -m "$commit_msg"

# 4. GitHub Pages로 푸시
git push origin master

echo "--- 배포가 완료되었습니다!"
echo "--- 사이트 확인: https://russellgeum.github.io"
```

## 🎨 커스터마이징

### 파비콘 설정

`static/` 폴더에 다음 파일들을 배치:
- `favicon.ico`
- `favicon-16x16.png`
- `favicon-32x32.png`
- `apple-touch-icon.png`

### 테마 설정

`hugo.yaml`에서 PaperMod 테마 설정을 커스터마이징할 수 있습니다:

```yaml
params:
  env: production
  title: 5biwan's BLOG
  description: "ExampleSite description"
  author: "5biwan"
  
  ShowReadingTime: true
  ShowShareButtons: true
  ShowPostNavLinks: false
  ShowBreadCrumbs: false
  ShowCodeCopyButtons: true
  showtoc: true
```

## 📚 사용 예시

### 완전한 워크플로우

```bash
# 1. 새 에세이 포스트 생성
hugo new --kind=essay content/posts/essay/2025-09-02-my-thoughts.md

# 2. VS Code에서 내용 작성
code content/posts/essay/2025-09-02-my-thoughts.md

# 3. draft: false로 변경 후 저장

# 4. 로컬에서 미리보기
hugo server -D

# 5. 배포
./deploy.sh

# 6. 사이트 확인
open https://russellgeum.github.io
```

### 대화형 방식

```bash
# 대화형 스크립트 실행
./new-post.sh

# 1. 카테고리 선택 (1: 생각, 2: 논문, 3: 기술, 4: 기본)
# 2. 제목 입력
# 3. 날짜 선택 (1: 오늘, 2: 직접 입력)
# 4. 확인 및 생성
# 5. VS Code로 열기 선택

# 내용 작성 후 배포
./deploy.sh
```

## 🔧 설정 방법

### 초기 설정

1. **Git 설정**
```bash
cd public
git init
git remote add origin https://github.com/russellgeum/russellgeum.github.io.git
git config user.name "5biwan"
git config user.email "your.email@example.com"
```

2. **실행 권한 부여**
```bash
chmod +x deploy.sh
chmod +x new-post.sh
chmod +x favicon-refresh.sh
```

3. **별칭 설정 (선택사항)**
```bash
# ~/.zshrc에 추가
source /path/to/BLOG/blog-aliases.sh
```

## 🚨 문제 해결

### 파비콘이 보이지 않는 경우

```bash
# 캐시 정리 및 새로 빌드
./favicon-refresh.sh

# 또는 수동으로
rm -rf public/ resources/ .hugo_build.lock
hugo server -D
```

### 배포 실패

```bash
# Git 상태 확인
cd public
git status

# 강제 푸시 (주의: 기존 히스토리 삭제됨)
git push origin master --force
```

### 테마 업데이트

```bash
cd themes/PaperMod
git pull origin master
```

## 🤝 기여하기

이 블로그는 개인 프로젝트이지만, 개선 사항이나 버그 리포트는 언제나 환영합니다!

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

---

**Author**: 5biwan  
**Contact**: russellgeum@example.com  
**Blog**: https://russellgeum.github.io

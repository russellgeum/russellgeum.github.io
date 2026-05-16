# russellgeum.github.io

Hugo + PaperMod 기반 개인 블로그 — ML/AI 논문 리뷰, 기술 노트, 에세이를 기록하는 공간.

- **블로그 주소**: https://russellgeum.github.io
- **프레임워크**: Hugo + PaperMod 테마
- **배포**: GitHub Actions (main 브랜치 push 시 자동 배포)

---

## 글 쓰는 방법

### A. Claude Code로 쓰기 (추천)

```bash
cd ~/Desktop/code/BLOG
claude
```

Claude Code를 켠 뒤 원하는 글을 요청하면 됩니다:
> "FlowNet 논문 리뷰 써줘" / "오늘 생각한 거 에세이로 써줘"

세션 종료 시 **자동으로 commit + push**됩니다 (Stop 훅).

### B. 직접 마크다운으로 쓰기

1. `content/papers/`, `content/essay/`, `content/dev/` 중 해당 폴더에 `YYMMDD.md` 파일 생성
2. front matter 작성:

```yaml
---
date: YYYY-MM-DD
author: "oppenheimer1223"
title: "[논문] 제목"
categories: "논문"
weight: 10
---
```

3. Claude Code가 열려 있으면 세션 종료 시 자동 push, 아니면 수동으로:

```bash
git add content/
git commit -m "새 글 추가"
git push origin main
```

### 자동 push 훅 동작 원리

`.claude/settings.local.json`에 Stop 훅이 설정되어 있습니다.

```
Claude Code 실행 → 글 작성 → 세션 종료
                                  ↓
             content/ 변경 감지 → 자동 commit + push
                                  ↓
                       GitHub Actions 빌드 & 배포
```

### 로컬 미리보기 (선택)

배포 전에 로컬에서 확인하려면:

```bash
hugo server -D   # http://localhost:1313
```

---

## 프로젝트 구조

```
.
├── .github/workflows/   # GitHub Actions 배포 워크플로우
├── .claude/             # Claude Code 설정 (자동 push 훅 포함)
├── archetypes/          # 글 템플릿 (essay, papers, dev)
├── content/             # 블로그 글 콘텐츠
│   ├── papers/          # 논문 리뷰
│   ├── essay/           # 에세이
│   └── dev/             # 기술/개발
├── static/              # 정적 리소스 (이미지 등)
├── themes/PaperMod/     # 테마 (서브모듈)
└── hugo.yaml            # Hugo 설정 파일
```

---

## 초기 세팅 (새 환경)

```bash
# 레포 클론 (서브모듈 포함)
git clone --recurse-submodules https://github.com/russellgeum/russellgeum.github.io.git
cd russellgeum.github.io

# Hugo Extended 설치 필요 (v0.152.2 이상)
# https://gohugo.io/installation/
```

---

## 트러블슈팅

### 테마를 찾을 수 없음

```bash
git submodule update --init --recursive
```

### Push 시 workflow 권한 에러

GitHub Personal Access Token에 `repo`와 `workflow` 스코프가 모두 필요합니다.
Settings → Developer settings → Personal access tokens에서 확인.

### 인증 실패 (토큰 만료)

```bash
git credential-osxkeychain erase <<EOF
protocol=https
host=github.com
EOF
```

이후 다시 push하면 새 인증 정보 입력 가능.

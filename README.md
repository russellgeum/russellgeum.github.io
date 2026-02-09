# russellgeum.github.io

Hugo 기반 개인 블로그 (PaperMod 테마)

## 블로그 빌드 & 배포 가이드

### 사전 요구사항

- [Hugo Extended](https://gohugo.io/installation/) v0.152.2 이상
- Git
- GitHub 계정 및 Personal Access Token (`repo`, `workflow` 스코프 필요)

### 로컬 빌드

```bash
# 레포 클론 (서브모듈 포함)
git clone --recurse-submodules https://github.com/russellgeum/russellgeum.github.io.git
cd russellgeum.github.io

# 빌드
hugo

# 로컬 서버 실행 (http://localhost:1313)
hugo server -D
```

### 배포 방식: GitHub Actions

`main` 브랜치에 push하면 자동으로 빌드 & 배포됩니다.

워크플로우 파일: `.github/workflows/deploy.yml`

**GitHub 설정:**
- Repository → Settings → Pages → Source → **GitHub Actions** 선택

---

## 트러블슈팅

### 1. 테마를 찾을 수 없음

**증상:** 빌드 시 테마 관련 에러 발생

**원인:** PaperMod 테마가 Git 서브모듈로 관리되는데, 서브모듈이 초기화되지 않은 경우

**해결:**
```bash
git submodule update --init --recursive
```

### 2. Google Analytics 경고

**증상:**
```
WARN  Google Analytics 4 (GA4) replaced Google Universal Analytics (UA)
```

**원인:** `hugo.yaml`의 `googleAnalytics` 값이 `UA-` 형식 (구버전)

**해결:** GA4 속성을 만들고 `G-XXXXXXXXXX` 형식의 ID로 교체하거나, 사용하지 않으면 해당 줄 삭제

### 3. Push 시 workflow 권한 에러

**증상:**
```
refusing to allow a Personal Access Token to create or update workflow without `workflow` scope
```

**원인:** GitHub Personal Access Token에 `workflow` 스코프가 없음

**해결:**
1. GitHub → Settings → Developer settings → Personal access tokens
2. 토큰 편집 또는 새로 생성
3. `repo`와 `workflow` 스코프 체크 후 저장

### 4. 인증 실패 (토큰 만료/변경)

**증상:**
```
remote: Invalid username or token.
fatal: Authentication failed
```

**해결:**
```bash
# macOS 키체인에서 기존 인증 정보 삭제
git credential-osxkeychain erase <<EOF
protocol=https
host=github.com
EOF

# 다시 push하면 새 인증 정보 입력 가능
git push origin main
```

### 5. 잘못된 날짜의 포스트 파일

**증상:** 존재하지 않는 날짜(예: 09월 31일)로 된 파일명

**해결:** 올바른 날짜로 파일명 수정 (예: `20210931.md` → `20210930.md`)

---

## 프로젝트 구조

```
.
├── .github/workflows/   # GitHub Actions 배포 워크플로우
├── archetypes/          # 글 템플릿 (essay, research, technical)
├── content/             # 블로그 글 콘텐츠
│   ├── essay/
│   ├── research/
│   └── technical/
├── layouts/             # 레이아웃 커스텀
├── public/              # 빌드 결과물
├── static/              # 정적 리소스 (이미지 등)
├── themes/PaperMod/     # 테마 (서브모듈)
└── hugo.yaml            # Hugo 설정 파일
```

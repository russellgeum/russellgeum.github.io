---
name: blog-setup
description: 새 컴퓨터에서 블로그 레포를 clone한 직후, 빌드 가능한 상태까지 자동으로 세팅한다. 서브모듈 초기화, Hugo 설치 확인, 빌드 테스트, 훅 등록 검증을 수행한다. "블로그 세팅해줘", "setup", "처음 환경 설정" 등 초기 설정 요청 시 트리거된다.
---

# Blog Setup Skill

새 환경(컴퓨터)에서 블로그가 정상 동작 가능한 상태인지 확인하고, 누락된 부분을 자동으로 채워준다.

## 실행 순서

다음 단계를 순서대로 수행한다. 각 단계의 결과를 사용자에게 짧게 보고한다.

### 1. PaperMod 서브모듈 확인

```bash
ls themes/PaperMod/layouts/ 2>/dev/null | head -1
```

빈 결과면 서브모듈이 초기화되지 않은 상태다. 다음을 실행한다.

```bash
git submodule update --init --recursive
```

### 2. Hugo Extended 설치 확인

```bash
hugo version
```

- `extended` 단어가 포함되어 있고 v0.152.2 이상이면 OK.
- 없거나 버전이 낮으면 macOS는 `brew install hugo`, 다른 OS는 https://gohugo.io/installation/ 안내.

### 3. 로컬 빌드 테스트

```bash
hugo --quiet
```

- exit code 0이면 OK.
- 에러 발생 시 출력을 분석하여 원인 (테마 누락, 설정 오류 등) 안내.

### 4. Stop 훅 등록 확인

`.claude/settings.json`이 존재하는지, Stop 훅이 정의되어 있는지 확인한다.

```bash
test -f .claude/settings.json && jq -e '.hooks.Stop' .claude/settings.json > /dev/null && echo "OK"
```

- OK가 아니면 사용자에게 `/hooks` 메뉴를 열어 활성화하도록 안내.

### 5. 결과 요약

다음 형식으로 사용자에게 결과를 보고한다.

```
블로그 세팅 검증 결과:
- [OK] PaperMod 서브모듈
- [OK] Hugo Extended v0.XXX.X
- [OK] 로컬 빌드
- [OK] Stop 훅 등록

이제 다음을 할 수 있습니다:
- hugo server -D  → 로컬 미리보기
- 논문 본문 던지기 → paper-review 스킬이 자동 처리
```

문제가 있는 항목은 `[FAIL]` 로 표시하고 해결 방법을 함께 안내한다.

## 주의사항

- 사용자 인증이 필요한 작업(git push, npm install -g 등)은 사용자에게 명령어를 보여주고 직접 실행하도록 안내한다.
- Hugo 설치를 자동으로 진행하지 않는다. brew/apt/winget 등 패키지 매니저 호출은 사용자 권한과 환경에 따라 다르므로 명령어만 제시한다.
- 빌드 실패 시 `public/` 폴더에 부분 결과가 남을 수 있으니 필요하면 정리 안내.

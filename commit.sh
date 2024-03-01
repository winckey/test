#!/bin/bash

# 고정된 년월 설정
YEAR_MONTH="2024-03"

# 입력값 확인 (일자 & 커밋 메시지)
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "사용법: ./commit.sh <일자> \"<커밋 메시지>\""
  exit 1
fi

DAY=$(printf "%02d" "$1") # 한 자리 숫자면 0을 붙여 두 자리로 변환
COMMIT_MESSAGE="$2"       # 커밋 메시지

# 랜덤 시간 생성 (18:00:00 ~ 23:59:59)
HOUR=$(( RANDOM % 6 + 18 ))  # 18 ~ 23 중 랜덤
MINUTE=$(( RANDOM % 60 ))    # 0 ~ 59 중 랜덤
SECOND=$(( RANDOM % 60 ))    # 0 ~ 59 중 랜덤

# 최종 날짜 포맷 (YYYY-MM-DD HH:MM:SS)
COMMIT_DATE="$YEAR_MONTH-$DAY $(printf "%02d:%02d:%02d" "$HOUR" "$MINUTE" "$SECOND")"

# Git 환경변수 설정 및 커밋 수행
GIT_COMMITTER_DATE="$COMMIT_DATE" git commit -m "$COMMIT_MESSAGE ($COMMIT_DATE)" --date="$COMMIT_DATE"

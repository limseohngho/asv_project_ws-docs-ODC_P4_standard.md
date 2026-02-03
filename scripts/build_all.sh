#!/bin/bash

# [ODC-P4] Coding Standard: Run Script
# Purpose: ROS 2 노드 실행 자동화 및 실행 로그 기록

# 1. 필수 디렉토리 확인
mkdir -p logs

# 2. 실행 로그 파일명 정의 (파일명 규칙 준수: run_yyyymmdd_hhmmss.log)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
RUN_LOG="logs/run_${TIMESTAMP}.log"

echo "=========================================="
echo "🚢 ASV Controller 실행을 시작합니다."
echo "📂 실행 로그: ${RUN_LOG}"
echo "=========================================="

# 3. 환경 설정 로드 (setup.bash)
# 빌드 결과물(install 폴더)이 있는지 확인 후 로드합니다.
if [ -f "install/setup.bash" ]; then
    source install/setup.bash
    echo "✅ 로컬 워크스페이스 환경 로드 완료."
else
    echo "❌ 에러: install/setup.bash 파일을 찾을 수 없습니다."
    echo "💡 먼저 ./scripts/build_all.sh 를 실행하여 빌드해 주세요."
    exit 1
fi

# 4. ROS 2 노드 실행 및 로그 기록
# - 실행 중 발생하는 모든 출력(stdout, stderr)을 터미널에 뿌리면서 동시에 파일로 저장합니다.
# - 패키지명: asv_controller (예시), 실행파일명: main_node (예시)
# - 실제 패키지/노드 명칭에 맞춰 수정 가능합니다.
ros2 run asv_controller main_node 2>&1 | tee ${RUN_LOG}

echo "=========================================="
echo "🛑 실행이 종료되었습니다. (Log: ${RUN_LOG})"
echo "=========================================="

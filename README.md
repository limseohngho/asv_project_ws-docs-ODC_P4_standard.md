# --- ROS 2 Build Artifacts ---
build/
install/
log/

# --- Project Specific Logs ---
# 가이드 표준에 따라 logs/ 폴더 내 모든 상세 로그 파일 업로드 방지
logs/*.log

# --- Python ---
__pycache__/
*.py[cod]
*$py.class
.pytest_cache/

# --- C++ ---
*.o
*.obj
*.a
*.la
*.lo

# --- Editor & OS ---
.vscode/
.idea/
.DS_Store
Thumbs.db

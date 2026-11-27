# 수학 기호 검색 및 유사 기호 추천 웹 시스템

## 프로젝트 소개
Python과 Streamlit을 활용하여 수학 기호를 검색하고, 입력한 단어와 유사한 기호를 추천하는 웹 서비스입니다.

사용자가 기호 이름, 설명 또는 분류를 입력하면 SQLite 데이터베이스에서 관련 정보를 조회합니다. 검색 결과가 없을 경우 문자열 유사도를 비교해 비슷한 기호 이름을 추천합니다.

## 사용 기술
- Python
- Streamlit
- SQLite / SQL
- difflib

## 주요 기능
1. **수학 기호 검색:** 이름, 설명, 분류를 기준으로 데이터베이스 검색
2. **유사 기호 추천:** difflib을 이용해 입력값과 유사한 기호 이름 추천
3. **검색 결과 출력:** 기호, LaTeX 표현, 설명 및 분류 표시
4. **데이터베이스 연동:** SQLite를 활용한 기호 정보 관리

## 프로젝트 파일
- `streamlit_symbol_gui_version.py`: Streamlit 웹 서비스
- `symbols.db.sql`: SQLite 데이터베이스 생성 및 초기 데이터 삽입을 위한 Python 코드

## 실행 방법

1. Python과 Streamlit 설치 환경 준비
2. `pip install streamlit` 실행
3. `python symbols.db.sql` 실행하여 데이터베이스 생성
4. `streamlit run streamlit_symbol_gui_version.py` 실행

## 프로젝트를 통해 경험한 내용
- Python을 활용한 웹 서비스 구성
- SQL을 이용한 데이터 검색
- 문자열 유사도 기반 검색어 보정
- 데이터베이스와 웹 화면 연동

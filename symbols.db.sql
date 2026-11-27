import sqlite3

# DB 연결
conn = sqlite3.connect("symbols.db")
cursor = conn.cursor()

# 테이블 생성 및 데이터 삽입 SQL (수정된 버전)
cursor.executescript("""
CREATE TABLE symbols (
    name TEXT,
    symbol TEXT,
    latex TEXT,
    description TEXT,
    category TEXT
);


INSERT INTO symbols VALUES
('pi','π','\\pi','원주율 (약 3.14159)','그리스 문자'),
('alpha','α','\\alpha','각도, 계수 등에 사용','그리스 문자'),
('subset','⊂','\\subset','부분집합','집합 기호'),
('forall','∀','\\forall','모든 경우에 대하여','논리 기호'),
('integral','∫','\\int','적분 기호','미적분 기호'),
('infinity','∞','\\infty','무한대','일반 기호'),
('exists','∃','\\exists','존재함을 의미','논리 기호'),
('and','∧','\\land','논리곱 (and)','논리 기호'),
('or','∨','\\lor','논리합 (or)','논리 기호'),
('not','¬','\\neg','부정 (not)','논리 기호'),
('pi','π','\\pi','원주율','그리스 문자'),
('alpha','α','\\alpha','그리스 문자 알파','그리스 문자'),
('beta','β','\\beta','그리스 문자 베타','그리스 문자'),
('gamma','γ','\\gamma','그리스 문자 감마','그리스 문자'),
('delta','δ','\\delta','그리스 문자 델타','그리스 문자'),
('subset','⊂','\\subset','부분집합','집합 기호'),
('in','∈','\\in','원소 포함','집합 기호'),
('union','∪','\\cup','합집합','집합 기호'),
('forall','∀','\\forall','모든 경우에 대해','논리 기호'),
('exists','∃','\\exists','존재함을 의미','논리 기호'),
('not','¬','\\neg','부정','논리 기호'),
('and','∧','\\land','논리곱 (and)','논리 기호'),
('or','∨','\\lor','논리합 (or)','논리 기호'),
('implies','⇒','\\Rightarrow','함의','논리 기호'),
('iff','⇔','\\Leftrightarrow','동치','논리 기호'),
('plus','+','+','더하기','산술 기호'),
('minus','-','-','빼기','산술 기호'),
('times','×','\\times','곱하기','산술 기호'),
('divide','÷','\\div','나누기','산술 기호'),
('integral','∫','\\int','적분','미적분 기호'),
('infinity','∞','\\infty','무한대','일반 기호'),
('sum','∑','\\sum','합계','일반 기호');
""")

conn.commit()
conn.close()

print("✅ symbols.db 생성 및 데이터 삽입 완료")


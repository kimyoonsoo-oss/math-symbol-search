import streamlit as st
import sqlite3
import difflib

# DB 연결
def connect_db():
    return sqlite3.connect("symbols.db")

# 기호 이름 전부 가져오기
def get_all_symbol_names():
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute("SELECT DISTINCT name FROM symbols;")
    names = [row[0] for row in cursor.fetchall()]
    conn.close()
    return names

# 유사 기호 추천
def suggest_similar_symbols(user_input, names, cutoff=0.6):
    return difflib.get_close_matches(user_input, names, n=3, cutoff=cutoff)

# 검색 기능
def search_symbol(keyword):
    conn = connect_db()
    cursor = conn.cursor()
    query = """
    SELECT * FROM symbols
    WHERE LOWER(name) LIKE ?
       OR LOWER(description) LIKE ?
       OR LOWER(category) LIKE ?
    """
    param = (f'%{keyword.lower()}%', f'%{keyword.lower()}%', f'%{keyword.lower()}%')
    cursor.execute(query, param)
    results = cursor.fetchall()
    conn.close()
    return results

# 검색 흐름 (오타 보정 포함)
def find_symbol(keyword):
    results = search_symbol(keyword)
    if results:
        return results, None
    else:
        names = get_all_symbol_names()
        suggestions = suggest_similar_symbols(keyword, names)
        if suggestions:
            corrected = suggestions[0]
            corrected_results = search_symbol(corrected)
            return corrected_results, corrected
        else:
            return [], None

# Streamlit UI
st.set_page_config(page_title="수학 기호 검색기")
st.title("📐 수학 기호 검색기")

keyword = st.text_input("🔎 기호 이름, 설명 또는 분류를 입력하세요:")

if keyword:
    result, corrected = find_symbol(keyword)
    if corrected:
        st.info(f"입력 보정: '{keyword}' → '{corrected}'")

    if result:
        for row in result:
            st.markdown("---")
            st.markdown(f"**이름:** {row[0]}")
            st.markdown(f"**기호:** {row[1]}")
            st.markdown(f"**LaTeX:** `{row[2]}`")
            st.markdown(f"**설명:** {row[3]}")
            st.markdown(f"**분류:** {row[4]}")
    else:
        st.warning(f"'{keyword}'와 유사한 기호를 찾을 수 없습니다.")

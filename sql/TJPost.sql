-- 사용자 생성
CREATE USER C##TJPost IDENTIFIED BY 1234;

-- CONNECT: 사용자가 DB에 접속할 수 있는 권한
-- RESOURCE: 데이터를 생성, 수정, 삭제할 수 있는 권한
GRANT CONNECT, RESOURCE TO C##TJPost;

-- 보드 테이블 생성
CREATE TABLE BOARD (
    BOARD_ID NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(255) NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_AUTHOR VARCHAR2(100) NOT NULL,
    BOARD_CREATED_DATE DATE DEFAULT SYSDATE
);

-- 보드 테이블 수정
ALTER TABLE BOARD
ADD LAST_UPDATED_DATE DATE DEFAULT SYSDATE;

-- 유저 테이블 생성
CREATE TABLE MEMBER (
    MEMBER_ID VARCHAR2(50) PRIMARY KEY,   -- 사용자 아이디
    MEMBER_PASSWORD VARCHAR2(255) NOT NULL,     -- 비밀번호
    MEMBER_NAME VARCHAR2(100) NOT NULL,         -- 이름
    MEMBER_EMAIL VARCHAR2(100) NOT NULL,                 -- 이메일
    MEMBER_CREATED_DATE DATE DEFAULT SYSDATE,   -- 가입일 (기본값: 현재 날짜)
    MEMBER_LAST_UPDATED_DATE DATE DEFAULT SYSDATE -- 수정일 (기본값: 현재 날짜)
);

DROP TABLE BOARD;

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--system 에서 유저 권한 줘야 에러 없이 DB 에 저장 가능
--ALTER USER C##TJPost DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;


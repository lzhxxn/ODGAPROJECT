--create user odga identified by java;
--grant connect, resource to odga;
--conn odga/java

--테이블 삭제
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE TOURLOC CASCADE CONSTRAINTS;
DROP TABLE HOTEL CASCADE CONSTRAINTS;
DROP TABLE PLANER CASCADE CONSTRAINTS;
DROP TABLE S_PLANER CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT CASCADE CONSTRAINTS;
DROP TABLE FILE_P CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE AREA CASCADE CONSTRAINTS;

--시쿼스 삭제
DROP SEQUENCE BOARD_ID;
DROP SEQUENCE TOURLOC_ID;
DROP SEQUENCE HOTEL_ID;
DROP SEQUENCE PLANER_ID;
DROP SEQUENCE S_PLANER_ID;
DROP SEQUENCE RESTAURANT_ID;
DROP SEQUENCE FILE_P_ID;
DROP SEQUENCE ADMIN_ID;
DROP SEQUENCE MEMBER_ID;
DROP SEQUENCE REPLY_ID;
DROP SEQUENCE AREA_ID;

PURGE RECYCLEBIN;

--테이블 생성/기본키 생성

-- 게시판
CREATE TABLE "BOARD" (
      "B_ID" NUMBER NOT NULL, -- 글id,
      "B_WRITER" VARCHAR2(20) NOT NULL, -- 작성자,
      "B_SUBJECT" VARCHAR2(100) NULL, -- 제목,
      "B_CONTENT" VARCHAR2(500) NULL, -- 내용,
      "B_RDATE" DATE NULL, -- 작성일,
      "B_CATGO" VARCHAR2(40) NULL, -- 카테고리
      "B_LIKE" NUMBER, -- 좋아요수
      "M_ID" NUMBER, -- 회원id,
      "A_ID" NUMBER -- 관리자id
);

-- 게시판
ALTER TABLE "BOARD"
   ADD CONSTRAINT "PK_BOARD" -- 게시판 기본키
   PRIMARY KEY (
      "B_ID" -- 글id
   );

-- 관광지
CREATE TABLE "TOURLOC" (
      "T_ID" NUMBER NOT NULL, -- 관광지id,
      "T_CATGO" VARCHAR2(40) NULL, -- 카테고리,
      "T_NAME" VARCHAR2(100) NULL, -- 장소명,
      "T_EXP" VARCHAR2(500) NULL, -- 설명,
      "T_ADDR" VARCHAR2(255) NULL, -- 주소,
      "T_HOMEP" VARCHAR2(255) NULL, -- 홈페이지,
      "T_MPHO" VARCHAR2(600) NULL, -- 대표사진,
      "A_ID" NUMBER NULL -- 지역id
);

-- 관광지
ALTER TABLE "TOURLOC"
   ADD CONSTRAINT "PK_TOURLOC" -- 관광지 기본키
   PRIMARY KEY (
      "T_ID" -- 관광지id
   );

-- 숙박
CREATE TABLE "HOTEL" (
      "H_ID" NUMBER NOT NULL, -- 숙소id,
      "H_CATGO" VARCHAR2(40) NULL, -- 카테고리,
      "H_NAME" VARCHAR2(100) NULL, -- 숙소명,
      "H_ADDR" VARCHAR2(255) NULL, -- 주소,
      "H_MPHO" VARCHAR2(355) NULL, -- 대표사진,
      "H_HOMEP" VARCHAR2(255) NULL, -- 홈페이지,
      "A_ID" NUMBER NOT NULL -- 지역id
);

-- 숙박
ALTER TABLE "HOTEL"
   ADD CONSTRAINT "PK_HOTEL" -- 숙박 기본키
   PRIMARY KEY (
      "H_ID" -- 숙소id
   );


-- 플래너
CREATE TABLE "PLANER" (
      "P_ID" NUMBER NOT NULL, --플랜id
      "P_RDATE" DATE,
      "M_ID" NUMBER  -- 회원id
);

-- 플래너
ALTER TABLE "PLANER"
   ADD CONSTRAINT "PK_PLANER" -- 플래너 기본키
   PRIMARY KEY (
      "P_ID" -- 플랜id
   );

-- 세부플래너
CREATE TABLE "S_PLANER" (
      "SP_ID" NUMBER NOT NULL, -- 세부플랜id,
      "SP_DAY" NUMBER NULL, -- DAY,
      "SP_SDAY" DATE NULL, -- 시작일,
      "SP_EDAY" DATE NULL, -- 종료일,
      "A_ID" NUMBER, -- 지역id,
      "T_ID" NUMBER, -- 관광지id
      "P_ID" NUMBER -- 플래너id
);

-- 세부플래너
ALTER TABLE "S_PLANER"
   ADD CONSTRAINT "PK_S_PLANER" -- 세부플래너 기본키
   PRIMARY KEY (
      "SP_ID" -- 세부플랜id
   );

-- 맛집
CREATE TABLE "RESTAURANT" (
      "R_ID" NUMBER NOT NULL, -- 맛집id,
      "R_CATGO" VARCHAR2(40) NULL, -- 카테고리,
      "R_NAME" VARCHAR2(100) NULL, -- 장소명,
      "R_ADDR" VARCHAR2(255) NULL, -- 주소,
      "R_MPHO" VARCHAR2(355) NULL, -- 대표사진,
      "R_HOMEP" VARCHAR2(255) NULL, -- 홈페이지,
      "A_ID" NUMBER NOT NULL -- 지역id
);

-- 맛집
ALTER TABLE "RESTAURANT"
   ADD CONSTRAINT "PK_RESTAURANT" -- 맛집 기본키
   PRIMARY KEY (
      "R_ID" -- 맛집id
   );

-- 사진업로드
CREATE TABLE "FILE_P" (
      "F_ID" NUMBER NOT NULL, -- 파일id,
      "F_FNAME" VARCHAR2(100) NULL, -- 파일이름,
      "F_FSIZE" NUMBER NULL, -- 파일사이즈,
      "F_DESC" VARCHAR2(300) NULL, -- 사진설명
      "B_ID" NUMBER NOT NULL -- 글id
);

-- 사진업로드
ALTER TABLE "FILE_P"
   ADD CONSTRAINT "PK_FILE_P" -- 사진업로드 기본키
   PRIMARY KEY (
      "F_ID" -- 파일id
   );

-- 관리자
CREATE TABLE "ADMIN" (
      "A_ID" NUMBER NOT NULL, -- 관리자id,
      "A_EMAIL" VARCHAR2(40) NULL, -- 이메일,
      "A_PWD" VARCHAR2(40) NULL, -- 비밀번호,
      "A_PHONE" VARCHAR(30) NULL -- 전화번호
);

-- 관리자
ALTER TABLE "ADMIN"
   ADD CONSTRAINT "PK_ADMIN" -- 관리자 기본키
   PRIMARY KEY (
      "A_ID" -- 관리자id
   );

-- 회원
CREATE TABLE "MEMBER" (
      "M_ID" NUMBER NOT NULL, -- 회원id,
      "M_EMAIL" VARCHAR2(40) NOT NULL, -- 이메일,
      "M_PWD" VARCHAR2(40) NULL, -- 비밀번호
      "M_NICK" VARCHAR2(100) NULL, -- 닉네임,
      "M_PHONE" VARCHAR2(30) NULL, -- 전화번호,
      "M_GENDER" VARCHAR(10) NULL, -- 성별,
      "M_BIRTH" DATE NULL, -- 생년월일,
      "M_RDATE" DATE NULL -- 가입일
);

-- 회원
ALTER TABLE "MEMBER"
   ADD CONSTRAINT "PK_MEMBER" -- 회원 기본키
   PRIMARY KEY (
      "M_ID" -- 회원id
   );

-- 댓글
CREATE TABLE "REPLY" (
      "RE_ID" NUMBER NOT NULL, -- 댓글id,
      "RE_WRITER" VARCHAR2(20) NULL, -- 작성자,
      "RE_CONTENT" VARCHAR2(500) NULL, -- 내용,
      "RE_RDATE" DATE NULL, -- 작성일,
      "B_ID" NUMBER NOT NULL -- 글id
);

-- 댓글
ALTER TABLE "REPLY"
   ADD CONSTRAINT "PK_REPLY" -- 댓글 기본키
   PRIMARY KEY (
      "RE_ID" -- 댓글id
   );

-- 지역
CREATE TABLE "AREA" (
      "A_ID" NUMBER NOT NULL, -- 지역id,
      "A_DO" VARCHAR2(40) NOT NULL, -- 도,
      "A_SG" VARCHAR2(40) NOT NULL -- 시/군
);

-- 지역
ALTER TABLE "AREA"
   ADD CONSTRAINT "PK_AREA" -- 지역 기본키
   PRIMARY KEY (
      "A_ID" -- 지역id
   );


--외래키

-- 게시판
ALTER TABLE "BOARD"
   ADD CONSTRAINT "FK_MEMBER_TO_BOARD" -- 회원 -> 게시판
   FOREIGN KEY (
      "M_ID" -- 회원id
   )
   REFERENCES "MEMBER" ( -- 회원
      "M_ID" -- 회원id
   );

-- 게시판
ALTER TABLE "BOARD"
   ADD CONSTRAINT "FK_ADMIN_TO_BOARD" -- 관리자 -> 게시판
   FOREIGN KEY (
      "A_ID" -- 관리자id
   )
   REFERENCES "ADMIN" ( -- 관리자
      "A_ID" -- 관리자id
   );

-- 관광지
ALTER TABLE "TOURLOC"
   ADD CONSTRAINT "FK_AREA_TO_TOURLOC" -- 지역 -> 관광지
   FOREIGN KEY (
      "A_ID" -- 지역id
   )
   REFERENCES "AREA" ( -- 지역
      "A_ID" -- 지역id
   );

-- 숙박
ALTER TABLE "HOTEL"
   ADD CONSTRAINT "FK_AREA_TO_HOTEL" -- 지역 -> 숙박
   FOREIGN KEY (
      "A_ID" -- 지역id
   )
   REFERENCES "AREA" ( -- 지역
      "A_ID" -- 지역id
   );


-- 플래너
ALTER TABLE "PLANER"
   ADD CONSTRAINT "FK_MEMBER_TO_PLANER" -- 회원 -> 플래너
   FOREIGN KEY (
      "M_ID" -- 회원id
   )
   REFERENCES "MEMBER" ( -- 회원
      "M_ID" -- 회원id
   );

-- 세부플래너
ALTER TABLE "S_PLANER"
   ADD CONSTRAINT "FK_AREA_TO_S_PLANER" -- 지역 -> 세부플래너
   FOREIGN KEY (
      "A_ID" -- 지역id
   )
   REFERENCES "AREA" ( -- 지역
      "A_ID" -- 지역id
   );
 
 -- 세부플래너
ALTER TABLE "S_PLANER"
   ADD CONSTRAINT "FK_TOURLOC_TO_S_PLANER" -- 관광지 -> 세부플래너
   FOREIGN KEY (
      "T_ID" -- 관광지id
   )
   REFERENCES "TOURLOC" ( -- 관광지
      "T_ID" -- 관광지id
   );

-- 세부플래너
ALTER TABLE "S_PLANER"
   ADD CONSTRAINT "FK_PLANER_TO_S_PLANER" -- 플래너 -> 세부플래너
   FOREIGN KEY (
      "P_ID" -- 플래너id
   )
   REFERENCES "PLANER" ( -- 플래너
      "P_ID"
   );

-- 맛집
ALTER TABLE "RESTAURANT"
   ADD CONSTRAINT "FK_AREA_TO_RESTAURANT" -- 지역 -> 맛집
   FOREIGN KEY (
      "A_ID" -- 지역id
   )
   REFERENCES "AREA" ( -- 지역
      "A_ID" -- 지역id
   );

-- 사진업로드
ALTER TABLE "FILE_P"
   ADD CONSTRAINT "FK_BOARD_TO_FILE_P" -- 게시판 -> 사진업로드
   FOREIGN KEY (
      "B_ID" -- 글id
   )
   REFERENCES "BOARD" ( -- 게시판
      "B_ID" -- 글id
   );

-- 댓글
ALTER TABLE "REPLY"
   ADD CONSTRAINT "FK_BOARD_TO_REPLY" -- 게시판 -> 댓글
   FOREIGN KEY (
      "B_ID" -- 글id
   )
   REFERENCES "BOARD" ( -- 게시판
      "B_ID" -- 글id
   );


--시쿼스 생성

--관리자
CREATE SEQUENCE ADMIN_ID
INCREMENT BY 1
START WITH 1
nocache;

--댓글
CREATE SEQUENCE REPLY_ID
INCREMENT BY 1
START WITH 1
nocache;

--첨부파일
CREATE SEQUENCE FILE_P_ID
INCREMENT BY 1
START WITH 1
nocache;

--게시판
CREATE SEQUENCE BOARD_ID
INCREMENT BY 1
START WITH 1
nocache;

--플래너
CREATE SEQUENCE PLANER_ID
INCREMENT BY 1
START WITH 1
nocache;

--세부플래너
CREATE SEQUENCE S_PLANER_ID
INCREMENT BY 1
START WITH 1
nocache;

--회원
CREATE SEQUENCE MEMBER_ID
INCREMENT BY 1
START WITH 1
nocache;

--지역
CREATE SEQUENCE AREA_ID
INCREMENT BY 1
START WITH 1
nocache;

--관광지
CREATE SEQUENCE TOURLOC_ID
INCREMENT BY 1
START WITH 1
nocache;

--맛집
CREATE SEQUENCE RESTAURANT_ID
INCREMENT BY 1
START WITH 1
nocache;

--숙소
CREATE SEQUENCE HOTEL_ID
INCREMENT BY 1
START WITH 1
nocache;
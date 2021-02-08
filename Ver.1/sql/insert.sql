--회원
INSERT INTO MEMBER VALUES (MEMBER_ID.nextval, 'ymhur2030@naver.com', '1234' , '허유민', '윰', '010-5519-5448', '여자', '98/02/03',SYSDATE);
INSERT INTO MEMBER VALUES (MEMBER_ID.nextval, 'chikchok@naver.com', '1234' , '칙촉', '', '010-1234-1234', '여자', '95/05/05',SYSDATE);
INSERT INTO MEMBER VALUES (MEMBER_ID.nextval, 'dfk@naver.com', '1234' , 'John', '쫀', '010-2344-4444', '남자', '90/12/11',SYSDATE);
select * from member;

--관리자
INSERT INTO ADMIN VALUES (ADMIN_ID.nextval, '이지훈', '1234', '010-1111-1111');
INSERT INTO ADMIN VALUES (ADMIN_ID.nextval, '박종범', '1234', '010-1111-1111');
INSERT INTO ADMIN VALUES (ADMIN_ID.nextval, '이민용', '1234', '010-1111-1111');
INSERT INTO ADMIN VALUES (ADMIN_ID.nextval, '권성환', '1234', '010-1111-1111');
INSERT INTO ADMIN VALUES (ADMIN_ID.nextval, '허유민', '1234', '010-1111-1111');
select * from ADMIN;

--게시판
INSERT INTO BOARD VALUES (BOARD_ID.nextval, '유민이', '우왕', '안냐세여', SYSDATE, '여행후기',0, 2, null);
INSERT INTO BOARD VALUES (BOARD_ID.nextval, '칙촉', '11', '안냐세여', SYSDATE, '여행후기', 0, 3, null);
INSERT INTO BOARD VALUES (BOARD_ID.nextval, '쫀', '암쫀', '안냐세여', SYSDATE, '문의하기', 0, 2, null);
select * from BOARD;

--지역
INSERT INTO AREA VALUES (AREA_ID.nextval, '경기도', '고양시');
INSERT INTO AREA VALUES (AREA_ID.nextval, '충청북도', '청주시');
INSERT INTO AREA VALUES (AREA_ID.nextval, '경상북도', '포항시');
select * from AREA;

--관광지
INSERT INTO TOURLOC VALUES (TOURLOC_ID.nextval, '음식점', '일산칼국수', '일산의 자랑! 일산의 명물!','경기 고양시 일산동구 백석로108번길 6-16',null,null,2);
INSERT INTO TOURLOC VALUES (TOURLOC_ID.nextval, '해수욕장', '영일대해수욕장', '포하항 포항 포하하항','경북 포항시 북구 두호동 685-1',null,null,4);
INSERT INTO TOURLOC VALUES (TOURLOC_ID.nextval, '야경명소', '수암골', '야경 짱','충북 청주시 상당구 수동로 15-4',null,null,3);
select * from TOURLOC;

--숙박
INSERT INTO HOTEL VALUES (HOTEL_ID.nextval, '호텔', '소노캄 고양', '경기도 고양시 일산동구 태극로 20 소노캄 고양',null,null,2);
INSERT INTO HOTEL VALUES (HOTEL_ID.nextval, '펜션', '마치블루풀빌라', '경북 포항시 북구 송라면 봉화길 202',null,null,3);
INSERT INTO HOTEL VALUES (HOTEL_ID.nextval, '호텔', '그랜드플라자청주호텔', '충북 청주시 청원구 충청대로 114',null,null,4);
select * from HOTEL;

--파일
INSERT INTO FILE_P VALUES (FILE_P_ID.nextval, 'asd.jpg', 156223, '이거슨 asd', 3);
INSERT INTO FILE_P VALUES (FILE_P_ID.nextval, '이것도입력이될지모르겠지만.png', 1562235, '이거슨 이것도', 2);
INSERT INTO FILE_P VALUES (FILE_P_ID.nextval, '여기까지도될까한번입력을해보겠습니다.jpg', 123, '이거슨 여기까지', 1);
select * from FILE_P;

--플래너
INSERT INTO PLANER VALUES (PLANER_ID.nextval, sysdate, 1);
INSERT INTO PLANER VALUES (PLANER_ID.nextval, sysdate, 2);
INSERT INTO PLANER VALUES (PLANER_ID.nextval, sysdate, 3);
select * from PLANER;

--세부플래너
INSERT INTO S_PLANER VALUES (S_PLANER_ID.nextval, 1, '2021-02-05', '2021-02-06',1,1,1);
INSERT INTO S_PLANER VALUES (S_PLANER_ID.nextval, 3, '2021-02-07', '2021-02-08',3,3,3);
INSERT INTO S_PLANER VALUES (S_PLANER_ID.nextval, 2, '2021-02-06', '2021-02-07',4,4,4);
select * from S_PLANER;

--맛집
INSERT INTO RESTAURANT VALUES (RESTAURANT_ID.nextval, '한식', '할머니순대국밥', '마포구 백범로221','asdmkc.jpg','www.asd.co.kr',1);
INSERT INTO RESTAURANT VALUES (RESTAURANT_ID.nextval, '한식', '할아버지순대국밥', '마포구 백범로222','asdmkcasd.jpg','www.asdd.co.kr',2);
INSERT INTO RESTAURANT VALUES (RESTAURANT_ID.nextval, '중식', '조선루', '마포구 백범로223','assdmkc.jpg','www.assd.co.kr',3);
select * from restaurant;
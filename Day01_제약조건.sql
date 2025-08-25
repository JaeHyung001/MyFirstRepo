-- Oracle 1����
-- �������� ���� ���̺�
CREATE TABLE USER_NO_CONSTRAINT(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(30),
    USER_NAME VARCHAR2(30),
    USER_GENDER VARCHAR2(10),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50)
);

DESC USER_NO_CONSTRAINT;

INSERT INTO USER_NO_CONSTRAINT
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', '��', '01012341234', 'olauser01@ola.com');
INSERT INTO USER_NO_CONSTRAINT
VALUES(2, 'olauser02', 'pass02', '�̿���', '��', '01012341234', 'olauser02@ola.com');
INSERT INTO USER_NO_CONSTRAINT
VALUES(3, null, 'pass03', '�����', '��', '01012341234', 'olauser03@ola.com');

SELECT * FROM USER_NO_CONSTRAINT;

DELETE FROM USER_NO_CONSTRAINT WHERE USER_NO = 1;

-- NOT NULL �������� ���̺�
CREATE TABLE USER_CONSTRAINT_NOTNULL(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) NOT NULL,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50)
);

SELECT * FROM USER_CONSTRAINT_NOTNULL;

INSERT INTO USER_CONSTRAINT_NOTNULL
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', '��', '01022223333', 'olauser01@ola.com');
INSERT INTO USER_CONSTRAINT_NOTNULL
VALUES(1, null, 'pass01', '�Ͽ���', '��', '01022223333', 'olauser01@ola.com');

-- UNIQUE �������� ���̺�
CREATE TABLE USER_CONSTRAINT_UNIQUE (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50)
);

INSERT INTO USER_CONSTRAINT_UNIQUE VALUES(1, 'olauser01', 'pass01', '�Ͽ���', '��', '01022223333', 'olauser01@ola.com');
INSERT INTO USER_CONSTRAINT_UNIQUE VALUES(1, 'olauser02', 'pass01', '�Ͽ���', '��', '01022223333', 'olauser01@ola.com');
-- UNIQUE ���������� NULL�� �����.
INSERT INTO USER_CONSTRAINT_UNIQUE VALUES(1, null, 'pass01', '�Ͽ���', '��', '01022223333', 'olauser01@ola.com');

SELECT * FROM USER_CONSTRAINT_UNIQUE;

-- PRIMARY KEY �������� ���̺�
CREATE TABLE USER_PRIMARY_KEY (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50)    
);

-- PRIMARY KEY�� �ߺ��� ������� �ʰ� NULL�� ������� ����.
-- ORA-00001: ���Ἲ ���� ����(OLAUSER01.SYS_C007397)�� ����˴ϴ�
-- SQL ����: ORA-01400: NULL�� ("OLAUSER01"."USER_PRIMARY_KEY"."USER_ID") �ȿ� ������ �� �����ϴ�
-- 01400. 00000 -  "cannot insert NULL into (%s)"
INSERT INTO USER_PRIMARY_KEY
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', '��', '01012343456', 'olauser01@ola.com');
INSERT INTO USER_PRIMARY_KEY
VALUES(1, null, 'pass01', '�Ͽ���', '��', '01012343456', 'olauser01@ola.com');

SELECT * FROM USER_PRIMARY_KEY;

-- CHECK �������� ���̺�
CREATE TABLE USER_CHECK (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10) CHECK(USER_GENDER IN ('M', 'F')),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50)    
);
DROP TABLE USER_CHECK;
-- ORA-02290: üũ ��������(OLAUSER01.SYS_C007401)�� ����Ǿ����ϴ�
INSERT INTO USER_CHECK
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', '��', '01012343456', 'olauser01@ola.com');
INSERT INTO USER_CHECK
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', 'M', '01012343456', 'olauser01@ola.com');

SELECT * FROM USER_CHECK;

-- DEFAULT �������� ���̺�
-- �⺻���� �����ϴ� ��������
CREATE TABLE USER_DEFAULT (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10) CHECK(USER_GENDER IN ('M', 'F')),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50),
    USER_DATE DATE DEFAULT SYSDATE, -- �ƹ��͵� �Է����� ������ �� ���� ����
    USER_YN CHAR(1) DEFAULT 'Y' -- �⺻���� �����ϴ� ��������
);
INSERT INTO USER_DEFAULT
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', 'M', '01012343456', 'olauser01@ola.com', DEFAULT);
SELECT * FROM USER_DEFAULT;

-- FOREIGN KEY �ܷ�Ű ��������
CREATE TABLE USER_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT INTO USER_GRADE VALUES(10, '�Ϲ�ȸ��');
INSERT INTO USER_GRADE VALUES(20, '���ȸ��');
INSERT INTO USER_GRADE VALUES(30, 'Ư��ȸ��');

SELECT * FROM USER_GRADE;
COMMIT;
--  ���� �� ������ �߰� �� Ȯ���غ�����
-- USER_GRADE�� ������ �θ� ���̺��Դϴ�. �ڽ����̺��� �� �÷��� �θ��÷��� �����͸� ����մϴ�.

CREATE TABLE USER_FOREIGNKEY (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10) CHECK(USER_GENDER IN ('M', 'F')),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50),
    USER_DATE DATE DEFAULT SYSDATE, -- �ƹ��͵� �Է����� ������ �� ���� ����
    GRADE_CODE NUMBER REFERENCES USER_GRADE(GRADE_CODE) -- USER_GRADE ���̺� �ִ� GRADE_CODE�� ���� ���ž�
    -- GRADE_CODE�� �� �� �ִ� ����? 10, 20, 30
);
CREATE TABLE USER_FOREIGNKEY (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10) CHECK(USER_GENDER IN ('M', 'F')),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50),
    USER_DATE DATE DEFAULT SYSDATE, -- �ƹ��͵� �Է����� ������ �� ���� ����
    GRADE_CODE NUMBER REFERENCES USER_GRADE(GRADE_CODE) ON DELETE CASCADE -- �θ� ���ڵ尡 ������ �� �ڽķ��ڵ嵵 ���� ������
    -- GRADE_CODE�� �� �� �ִ� ����? 10, 20, 30
);
CREATE TABLE USER_FOREIGNKEY (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(10) CHECK(USER_GENDER IN ('M', 'F')),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50),
    USER_DATE DATE DEFAULT SYSDATE, -- �ƹ��͵� �Է����� ������ �� ���� ����
    GRADE_CODE NUMBER REFERENCES USER_GRADE(GRADE_CODE) ON DELETE SET NULL -- �θ� ���ڵ尡 ������ �� �ڽķ��ڵ忡�� NULL�� ��
    -- GRADE_CODE�� �� �� �ִ� ����? 10, 20, 30
);
DROP TABLE USER_FOREIGNKEY;
SELECT * FROM USER_FOREIGNKEY;
COMMIT;
INSERT INTO USER_FOREIGNKEY
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', 'M', '01012343456', 'olauser01@ola.com', DEFAULT, 10);
INSERT INTO USER_FOREIGNKEY
VALUES(2, 'olauser02', 'pass02', '�̿���', 'M', '01012343456', 'olauser01@ola.com', DEFAULT, 20);
INSERT INTO USER_FOREIGNKEY
VALUES(3, 'olauser03', 'pass03', '�����', 'M', '01012343456', 'olauser01@ola.com', DEFAULT, 30);
-- ���� ���Ἲ�� �����ϴ�  FOREIGNKEY�� ����
-- �ڽ� ���̺��� insert�� ��, �θ� ���̺��� ������ �ִ� �÷��� �ʵ尪���θ� insert�� �ǵ��� ��.
-- �θ����̺����� �����͸� �Ժη� ������ ����. -> �� �׷��ſ���? ���� ���Ἲ ������ �ʱ� ���ؼ� ������ ����.
INSERT INTO USER_FOREIGNKEY
VALUES(4, 'olauser04', 'pass04', '�����', 'M', '01012343456', 'olauser01@ola.com', DEFAULT, 40);
COMMIT;


-- * �θ��ڵ带 �����Ϸ���
-- ORA-02292: ���Ἲ ��������(OLAUSER01.SYS_C007426)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
DELETE FROM USER_GRADE WHERE GRADE_CODE = 10;


-- 1. �ڽ� ���ڵ带 ���� �� �θ� ���ڵ� ���� ����
DELETE FROM USER_FOREIGNKEY WHERE GRADE_CODE = 10;
ROLLBACK;
-- 2. �ܷ�Ű ������ ���� �ɼ� ON DELETE CASCADE �ٿ��ֱ�
-- > �θ��ڵ�� �ڽķ��ڵ� ��� ������.
-- 3. �ܷ�Ű ������ ���� �ɼ� ON DELETE SET NULL �ٿ��ֱ�
-- > �θ��ڵ� ���� �� �ڽķ��ڵ忡�� ������ ���� NULL�� ��.

-- �ܷ�Ű(FOREIGNKEY) ����
-- SHOP �� ���̺� (SHOP_MEMBER)
-- USER_NO, USER_ID, USER_PWD, USER_NAME, USER_GENDER, USER_PHONE, USER_EMAIL
-- NUMBER, VARCHAR2(30), VARCHAR2(50), VARCHAR2(20), 
-- ���� 1���� 1����Ʈ, �ѱ� 1���� 3����Ʈ
CREATE TABLE SHOP_MEMBER(
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GEDNER VARCHAR2(10),
    USER_PHONE VARCHAR2(30),
    USER_EMAIL VARCHAR2(50)
);
INSERT INTO SHOP_MEMBER
VALUES(1, 'olauser01', 'pass01', '�Ͽ���', 'M', '01082893933','olauser01@naver.com');
INSERT INTO SHOP_MEMBER
VALUES(2, 'olauser02', 'pass02', '�Ͽ���', 'M', '01082893933','olauser02@naver.com');
INSERT INTO SHOP_MEMBER
VALUES(3, 'olauser03', 'pass03', '�Ͽ���', 'M', '01082893933','olauser03@naver.com');
-- SHOP ���ų��� ���̺� (SHOP_BUY)
-- BUY_NO, USER_ID, PRODUCT_NAME, REG_DATE
-- SHOP ���� ���ؼ� ������ ������ �� �ֵ��� �ܷ�Ű ���������� �����غ�����
CREATE TABLE SHOP_BUY (
    BUY_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) REFERENCES SHOP_MEMBER(USER_ID) ON DELETE SET NULL,
    PRODUCT_NAME VARCHAR2(20),
    REG_DATE DATE DEFAULT SYSDATE
);

INSERT INTO SHOP_BUY
VALUES(1, 'olauser01', '��ȭ', DEFAULT);
INSERT INTO SHOP_BUY
VALUES(2, 'olauser02', '�౸ȭ', DEFAULT);
INSERT INTO SHOP_BUY
VALUES(3, 'olauser03', '�豸ȭ', DEFAULT);
INSERT INTO SHOP_BUY
VALUES(4, 'olauser04', '����ȭ', DEFAULT);

-- �θ� ���ڵ� ����
-- ON DELETE SET NULL -> �ڽķ��ڵ忡�� ������ ���� NULL�� �ȴ� OLAUSER01 -> NULL
DELETE FROM SHOP_MEMBER WHERE USER_ID = 'olauser01';

COMMIT;
SELECT * FROM SHOP_MEMBER;
SELECT * FROM SHOP_BUY;

-- UPDATE ����
SELECT * FROM SHOP_BUY;
-- BUY_NO�� 1�� ���ڵ��� USER_ID ���� NULL
-- NULL -> OLAUSER01�� �ٲٱ� ���� �������� �ۼ��Ͻÿ�
UPDATE SHOP_BUY
SET USER_ID = 'olauser01'
WHERE BUY_NO = 1;

ROLLBACK;
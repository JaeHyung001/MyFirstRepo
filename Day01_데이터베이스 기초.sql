SHOW USER;

CREATE TABLE STUDENT_TBL (
    NO NUMBER,
    NAME VARCHAR2(12), -- VARCHAR2 : ���ڿ�
    AGE NUMBER
);

-- ���̺� ������ ��ȸ ������(��ɾ�)
SELECT * FROM STUDENT_TBL; 

-- ���̺� ���� Ȯ��(���̺� ��Ű�� Ȯ�� ������)(��ɾ�)
DESC STUDENT_TBL; 

-- ���̺� ������ �߰�(����) ������
INSERT INTO STUDENT_TBL(NO, NAME, AGE) VALUES(1, '�Ͽ���', 33);

-- ���̺� ������ ���� ������
DELETE FROM STUDENT_TBL;

-- ���̺� ������ ���� ������
UPDATE STUDENT_TBL
SET NAME = '�̿���';

-- ������ ��ȸ ������
SELECT * FROM STUDENT_TBL;

-- ROLLBACK, ���� Ŀ�� �������� ���ư�.
ROLLBACK;
-- COMMIT, Ʈ������ ���� �� ���� ����
COMMIT;

-- ���̺� ���� 
DROP TABLE STUDENT_TBL;


-- ���̺� == Relation
-- ��(Column) ��(Column) ��(Column)
-- ��(Tuple) Ʃ��
-- ��(Tuple)
-- ��(Tuple)

-- CHAR : �������� (�ѱ� 1���� �� 3BYTE)
-- VARCHAR2 : �������� (������ ����)
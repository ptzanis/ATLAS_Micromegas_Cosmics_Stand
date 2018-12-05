ALTER TABLE FW_SYS_STAT_COMPUTER ADD WCCOA_INSTALL_PKG VARCHAR2(150);
ALTER TABLE FW_SYS_STAT_COMPUTER ADD "COMMENT" VARCHAR2(1000);
ALTER TABLE FW_SYS_STAT_COMPUTER ADD status VARCHAR2(100);

ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD status VARCHAR2(100);
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD "COMMENT" VARCHAR2(1000);
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD creation_jira_issue VARCHAR2(10);
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD wccoa_url VARCHAR2(200);
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD info_url VARCHAR2(200);
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD application_domain VARCHAR2(20);
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD service_account VARCHAR2(50);

CREATE TABLE FW_SYS_STAT_ACCOUNTS
(
  id           NUMBER NOT NULL ,
  account_name VARCHAR2 (100),
  CONSTRAINT ACCOUNT_ID_PK PRIMARY KEY(id),
  CONSTRAINT ACCOUNT_UQ UNIQUE(account_name)
);
CREATE SEQUENCE FW_SYS_STAT_ACCOUNTS_SQ
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE TABLE FW_SYS_STAT_SCADA_EXPERTS
(
  id          NUMBER NOT NULL,
  computer_id NUMBER NOT NULL,
  account_id  NUMBER NOT NULL,
  valid_from  DATE,
  valid_until DATE,
  CONSTRAINT EXPERT_ID_PK PRIMARY KEY(id),
  CONSTRAINT EXPERT_UQ UNIQUE(computer_id, account_id, valid_until),
  CONSTRAINT EXPERT_ACCOUNT_ID_FK FOREIGN KEY (account_id) REFERENCES FW_SYS_STAT_ACCOUNTS(id) ON DELETE CASCADE,
  CONSTRAINT EXPERT_COMPUTER_ID_FK FOREIGN KEY (computer_id) REFERENCES FW_SYS_STAT_COMPUTER(id) ON DELETE CASCADE
);
CREATE SEQUENCE FW_SYS_STAT_SCADA_EXPERT_SQ
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE TABLE FW_SYS_STAT_WCCOA_APPLICATIONS
(
  id          NUMBER NOT NULL,
  project_id  NUMBER NOT NULL,
  name        VARCHAR2(100) NOT NULL,
  info_url    VARCHAR2(200),
  "COMMENT"   VARCHAR2(1000),
  status      VARCHAR2(100),
  responsible VARCHAR2(128),
  valid_from  DATE,
  valid_until DATE,
  CONSTRAINT APPLICATION_ID_PK PRIMARY KEY(id),
  CONSTRAINT APPLICATION_UQ UNIQUE(project_id , name , valid_until),
  CONSTRAINT APPLICATION_PROJECT_ID_FK FOREIGN KEY (project_id) REFERENCES FW_SYS_STAT_PVSS_PROJECT(id) ON DELETE CASCADE
);
CREATE SEQUENCE FW_SYS_STAT_WCCOA_APP_SQ
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE TABLE FW_SYS_STAT_WCCOA_DEVICE_TYPES
(
  id   NUMBER NOT NULL,
  name VARCHAR2(100),
  CONSTRAINT DEVICE_TYPE_ID_PK PRIMARY KEY(id),
  CONSTRAINT DEVICE_TYPE_UQ UNIQUE(name)
);
CREATE SEQUENCE FW_SYS_STAT_WCCOA_DEV_TYPE_SQ
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE TABLE FW_SYS_STAT_WCCOA_DEVICES
(
  id             NUMBER NOT NULL,
  project_id     NUMBER NOT NULL,
  application_id NUMBER,
  device_type_id NUMBER NOT NULL,
  name           VARCHAR2(100) NOT NULL,
  valid_from     DATE,
  valid_until    DATE,
  info_url       VARCHAR2 (200),
  "COMMENT"      VARCHAR2(1000),
  status         VARCHAR2(200),
  CONSTRAINT DEVICE_ID_PK PRIMARY KEY(id),
  CONSTRAINT DEVICE_UQ UNIQUE(project_id , name , valid_until),
  CONSTRAINT DEVICE_APPLICATION_ID_FK FOREIGN KEY(application_id) REFERENCES FW_SYS_STAT_WCCOA_APPLICATIONS(id) ON DELETE CASCADE,
  CONSTRAINT DEVICE_DEVICE_TYPE_ID_FK FOREIGN KEY(device_type_id) REFERENCES FW_SYS_STAT_WCCOA_DEVICE_TYPES(id) ON DELETE CASCADE,
  CONSTRAINT DEVICE_PROJECT_ID_FK FOREIGN KEY(project_id) REFERENCES FW_SYS_STAT_PVSS_PROJECT(id) ON DELETE CASCADE
);
CREATE SEQUENCE FW_SYS_STAT_WCCOA_DEVICE_SQ
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE TABLE FW_SYS_STAT_WCCOA_PROJ_ACCESS
(
  id          NUMBER NOT NULL,
  project_id  NUMBER NOT NULL,
  account_id  NUMBER NOT NULL,
  valid_from  DATE,
  valid_until DATE,
  developer   NUMBER,
  CONSTRAINT PROJ_ACCESS_ID_PK PRIMARY KEY(id),
  CONSTRAINT PROJ_ACCESS_UQ UNIQUE(project_id , account_id , valid_until),
  CONSTRAINT PROJ_ACCESS_ACCOUNT_ID_FK FOREIGN KEY(account_id) REFERENCES FW_SYS_STAT_ACCOUNTS(id) ON DELETE CASCADE,
  CONSTRAINT PROJ_ACCESS_PROJECT_ID_FK FOREIGN KEY(project_id) REFERENCES FW_SYS_STAT_PVSS_PROJECT(id) ON DELETE CASCADE
);
CREATE SEQUENCE FW_SYS_STAT_WCCOA_PROJ_ACC_SQ
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

--Upgrade Schema version
CREATE OR REPLACE VIEW fw_sys_stat_schema (version) AS
	SELECT '5.1.2'
	FROM dual;
COMMIT;
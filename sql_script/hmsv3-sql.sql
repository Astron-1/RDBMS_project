CREATE SCHEMA public;

CREATE  TABLE public.`Department` ( 
	dept_id              VARCHAR(20)  NOT NULL     PRIMARY KEY,
	dept_name            TEXT(20)  NOT NULL     ,
	dept_head            VARCHAR(20)  NOT NULL     ,
	CONSTRAINT unq_department_dept_id UNIQUE ( dept_id ) ,
	CONSTRAINT unq_department_dept_name UNIQUE ( dept_name ) ,
	CONSTRAINT unq_department_dept_head UNIQUE ( dept_head ) 
 );

CREATE  TABLE public.`Doctors` ( 
	`DR_id`              VARCHAR(30)  NOT NULL     PRIMARY KEY,
	`F_name`             TEXT(15)  NOT NULL     ,
	`M_name`             TEXT(15)       ,
	`L_name`             TEXT(15)       ,
	`Nationality`        TEXT(15)  NOT NULL     ,
	gender               TEXT(10)  NOT NULL     ,
	`DOB`                DATE  NOT NULL     ,
	`Email_id`           VARCHAR(50)  NOT NULL     ,
	`PHONE_NO`           VARCHAR(10)  NOT NULL     ,
	`Dept_id`            VARCHAR(20)  NOT NULL     ,
	`Designation`        TEXT(20)  NOT NULL     ,
	`Specialization`     TEXT(20)  NOT NULL     ,
	CONSTRAINT unq_doctors_email_id UNIQUE ( `Email_id` ) ,
	CONSTRAINT unq_doctors_phone_no UNIQUE ( `PHONE_NO` ) 
 );

CREATE  TABLE public.`Patient_detail` ( 
	`P_id`               VARCHAR(30)  NOT NULL    PRIMARY KEY,
	`F_name`             TEXT(15)  NOT NULL     ,
	`M_name`             TEXT(15)       ,
	`L_name`             TEXT(15)       ,
	`Nationality`        TEXT(15)  NOT NULL     ,
	gender               TEXT(10)  NOT NULL     ,
	`DOB`                DATE  NOT NULL     ,
	`Email_id`           VARCHAR(50)       ,
	`PHONE_NO`           VARCHAR(10)  NOT NULL     
 );

CREATE  TABLE public.feedback ( 
	feedback_id          VARCHAR(20)  NOT NULL     PRIMARY KEY,
	p_id                 VARCHAR(30)       ,
	ratings              SMALLINT       ,
	comments             VARCHAR(250)       ,
	`date `              DATE   DEFAULT 'CURRENT_DATE'    
 ) engine=InnoDB;

CREATE  TABLE public.hospital ( 
	hosp_id              VARCHAR(10)  NOT NULL    PRIMARY KEY,
	name                 TEXT(50)  NOT NULL     ,
	`type`               VARCHAR(20)  NOT NULL     ,
	area                 VARCHAR(20)  NOT NULL     ,
	road                 VARCHAR(20)  NOT NULL     ,
	building             VARCHAR(20)       ,
	county               VARCHAR(15)  NOT NULL     
 );

CREATE  TABLE public.hospital_contact ( 
	hosp_id              VARCHAR(10)  NOT NULL     ,
	phone                VARCHAR(10)  NOT NULL     ,
	email                VARCHAR(55)  NOT NULL     ,
	website              VARCHAR(30)       
 );

CREATE  TABLE public.patient_report ( 
	`Report_id`          VARCHAR(20)  NOT NULL    PRIMARY KEY,
	`P_id`               VARCHAR(30)  NOT NULL     ,
	diagnose             VARCHAR(50)       ,
	reference            VARCHAR(50)       ,
	report_img           BLOB       
 );

CREATE  TABLE public.staff ( 
	`ST_id`              VARCHAR(30)  NOT NULL     PRIMARY KEY,
	`F_name`             TEXT(15)  NOT NULL     ,
	`M_name`             TEXT(15)       ,
	`L_name`             TEXT(15)       ,
	`Nationality`        TEXT(15)  NOT NULL     ,
	gender               TEXT(10)  NOT NULL     ,
	`DOB`                DATE  NOT NULL     ,
	`Email_id`           VARCHAR(50)  NOT NULL     ,
	`PHONE_NO`           VARCHAR(10)  NOT NULL     ,
	`Dept_id`            VARCHAR(20)  NOT NULL     ,
	designation          TEXT(20)  NOT NULL     ,
	CONSTRAINT unq_staff_email_id UNIQUE ( `Email_id` ) ,
	CONSTRAINT unq_staff_phone_no UNIQUE ( `PHONE_NO` ) 
 );

CREATE  TABLE public.staff_login ( 
	login_id             VARCHAR(30)  NOT NULL   AUTO_INCREMENT  ,
	`Email_id`           VARCHAR(50)  NOT NULL     ,
	`Password`           VARCHAR(50)  NOT NULL     ,
	created_at           DATETIME  NOT NULL DEFAULT 'CURRENT_TIMESTAMP'    ,
	role                 TEXT(10)   DEFAULT 'viewer',
	CONSTRAINT unq_staff_login_email_id UNIQUE ( `Email_id` ) 
 );

CREATE  TABLE public.test_price ( 
	test_code            VARCHAR(10)  NOT NULL    PRIMARY KEY,
	test_price           DECIMAL(10,2)  NOT NULL     ,
	test_detail          TEXT(255)       
 );

CREATE  TABLE public.user_login ( 
	`U_id`               VARCHAR(30)  NOT NULL     PRIMARY KEY,
	`Email_id`           VARCHAR(50)  NOT NULL     ,
	`Password`           VARCHAR(50)  NOT NULL     ,
	created_at           DATETIME DEFAULT 'CURRENT_TIMESTAMP'     ,
	CONSTRAINT unq_user_login_email_id UNIQUE ( `Email_id` ) 
 );

CREATE  TABLE public.`Address` ( 
	`Add_id`             VARCHAR(20)  NOT NULL   PRIMARY KEY,
	`Add_LINE_1`         VARCHAR(50)  NOT NULL     ,
	`Add_LINE_2`         VARCHAR(50)       ,
	`State`              TEXT(15)  NOT NULL     ,
	`CITY`               TEXT(20)  NOT NULL     ,
	zip                  INT  NOT NULL     ,
	add_type             TEXT(15)  NOT NULL DEFAULT 'Home'    ,
	id                   VARCHAR(30)       
 );

CREATE  TABLE public.`Appointment` ( 
	`Apt_id`             VARCHAR(10)  NOT NULL     PRIMARY KEY,
	`P_id`               VARCHAR(30)  NOT NULL     ,
	dr_id                VARCHAR(30)  NOT NULL     ,
	`desc`               VARCHAR(255)  NOT NULL     ,
	`date`               DATE  NOT NULL     ,
	slot_start           TIME  NOT NULL     ,
	slot_end             TIME  NOT NULL     ,
	created_at           DATETIME  NOT NULL DEFAULT 'CURRENT_TIMESTAMP'    ,
	price                INT  NOT NULL     
 );

CREATE  TABLE public.`BILL` ( 
	bill_no              VARCHAR(10)  NOT NULL     PRIMARY KEY,
	`P_id`               VARCHAR(10)  NOT NULL     ,
	doc_charge           INT  NOT NULL     ,
	med_charge           INT  NOT NULL     ,
	room_charge          INT  NOT NULL     ,
	operation_charge     INT  NOT NULL     ,
	no_of_days           INT  NOT NULL     ,
	nurshing_charge      INT  NOT NULL     ,
	lab_charge           INT  NOT NULL     ,
	`Advance_paid`       INT  NOT NULL     
 );

CREATE  TABLE public.`Room` ( 
	`Room_no`            VARCHAR(10)  NOT NULL    PRIMARY KEY,
	`type`               VARCHAR(10)  NOT NULL     ,
	`status`             VARCHAR(10)  NOT NULL     ,
	no_bed               INT  NOT NULL     ,
	hosp_id              VARCHAR(10)  NOT NULL     
 );

CREATE  TABLE public.cu_rel ( 
	p_id                 VARCHAR(30)       ,
	u_id                 VARCHAR(30)       ,
	relation             VARCHAR(10)   DEFAULT 'SELF' 
 ) engine=InnoDB;

CREATE  TABLE public.lab_detail ( 
	lab_no               VARCHAR(10)  NOT NULL  PRIMARY KEY,
	dept_id              VARCHAR(20)  NOT NULL     ,
	room_no              VARCHAR(20)  NOT NULL     ,
	lab_name             VARCHAR(20)  NOT NULL     ,
	CONSTRAINT unq_lab_detail_lab_no UNIQUE ( lab_no ) ,
	CONSTRAINT unq_lab_detail_lab_name UNIQUE ( lab_name ) 
 );

CREATE  TABLE public.`Inpatient` ( 
	p_id                 VARCHAR(30)  NOT NULL     ,
	`Room_id`            VARCHAR(10)  NOT NULL     ,
	doc_id               VARCHAR(30)  NOT NULL     ,
	lab_no               VARCHAR(30)  NOT NULL     ,
	date_of_admit        DATETIME  NOT NULL     ,
	date_of_discharge    DATETIME  NOT NULL     ,
	disease_desc         CHAR(255)  NOT NULL     
 );

CREATE  TABLE public.`Outpatient` ( 
	`P_id`               VARCHAR(30)  NOT NULL     ,
	`date`               DATETIME  NOT NULL     ,
	lab_no               VARCHAR(20)  NOT NULL     
 );

CREATE  TABLE public.lab ( 
	lab_id               VARCHAR(20)  NOT NULL     PRIMARY KEY,
	lab_no               VARCHAR(20)  NOT NULL     ,
	`P_id`               VARCHAR(30)  NOT NULL     ,
	test_type            TEXT(30)  NOT NULL     ,
	height               DECIMAL       ,
	weight               DECIMAL       ,
	`date`               DATETIME  NOT NULL     ,
	blood_pressure       DECIMAL       ,
	temp                 DECIMAL       ,
	category             TEXT(10)  NOT NULL     ,
	`P_type`             TEXT(10)  NOT NULL     ,
	`Blood_type`         VARCHAR(4)       ,
	test_code            VARCHAR(10)       
 );

ALTER TABLE public.`Address` ADD CONSTRAINT fk_address_staff FOREIGN KEY ( id ) REFERENCES public.staff( `ST_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Address` ADD CONSTRAINT fk_address_doctors FOREIGN KEY ( id ) REFERENCES public.`Doctors`( `DR_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Address` ADD CONSTRAINT fk_address_patient_detail FOREIGN KEY ( id ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Appointment` ADD CONSTRAINT `Appointment_fk0` FOREIGN KEY ( `P_id` ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Appointment` ADD CONSTRAINT `Appointment_fk1` FOREIGN KEY ( dr_id ) REFERENCES public.`Doctors`( `DR_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`BILL` ADD CONSTRAINT `BILL_fk0` FOREIGN KEY ( `P_id` ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Doctors` ADD CONSTRAINT `Doctors_fk0` FOREIGN KEY ( `Dept_id` ) REFERENCES public.`Department`( dept_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Inpatient` ADD CONSTRAINT `Inpatient_fk0` FOREIGN KEY ( p_id ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Inpatient` ADD CONSTRAINT `Inpatient_fk1` FOREIGN KEY ( `Room_id` ) REFERENCES public.`Room`( `Room_no` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Inpatient` ADD CONSTRAINT `Inpatient_fk2` FOREIGN KEY ( doc_id ) REFERENCES public.`Doctors`( `DR_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Outpatient` ADD CONSTRAINT `Outpatient_fk0` FOREIGN KEY ( `P_id` ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Outpatient` ADD CONSTRAINT fk_outpatient_lab_detail FOREIGN KEY ( lab_no ) REFERENCES public.lab_detail( lab_no ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.`Room` ADD CONSTRAINT `Room_fk0` FOREIGN KEY ( hosp_id ) REFERENCES public.hospital( hosp_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.cu_rel ADD CONSTRAINT fk_cu_rel_user_login FOREIGN KEY ( u_id ) REFERENCES public.user_login( `U_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.cu_rel ADD CONSTRAINT fk_cu_rel_patient_detail FOREIGN KEY ( p_id ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.feedback ADD CONSTRAINT fk_feedback_patient_detail FOREIGN KEY ( p_id ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.hospital_contact ADD CONSTRAINT hospital_contact_fk0 FOREIGN KEY ( hosp_id ) REFERENCES public.hospital( hosp_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.lab ADD CONSTRAINT lab_fk0 FOREIGN KEY ( lab_no ) REFERENCES public.lab_detail( lab_no ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.lab ADD CONSTRAINT lab_fk1 FOREIGN KEY ( `P_id` ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.lab ADD CONSTRAINT lab_fk2 FOREIGN KEY ( test_code ) REFERENCES public.test_price( test_code ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.lab_detail ADD CONSTRAINT lab_detail_fk0 FOREIGN KEY ( dept_id ) REFERENCES public.`Department`( dept_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.lab_detail ADD CONSTRAINT lab_detail_fk1 FOREIGN KEY ( room_no ) REFERENCES public.`Room`( `Room_no` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.patient_report ADD CONSTRAINT patient_report_fk0 FOREIGN KEY ( `P_id` ) REFERENCES public.`Patient_detail`( `P_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.staff ADD CONSTRAINT staff_fk0 FOREIGN KEY ( `Dept_id` ) REFERENCES public.`Department`( dept_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.staff_login ADD CONSTRAINT staff_login_fk0 FOREIGN KEY ( login_id ) REFERENCES public.`Doctors`( `DR_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.staff_login ADD CONSTRAINT fk_staff_login_staff FOREIGN KEY ( login_id ) REFERENCES public.staff( `ST_id` ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.feedback COMMENT 'here we record feedback of every patient.';

ALTER TABLE public.feedback MODIFY p_id VARCHAR(30)     COMMENT 'Patient id from patient detail.';

ALTER TABLE public.feedback MODIFY ratings SMALLINT     COMMENT 'rate 1 to 5.';

ALTER TABLE public.`Address` MODIFY id VARCHAR(30)     COMMENT 'This is the foreign key from deifferent entity and here in this table we add there address.';

ALTER TABLE public.cu_rel COMMENT 'here we record the relation between user and patient.\nThe relation can be self,parents';

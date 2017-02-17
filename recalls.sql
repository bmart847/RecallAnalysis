DROP TABLE IF EXISTS tsbs;
CREATE TABLE IF NOT EXISTS tsbs (
    bulno  character varying(16),
    bulrep  character varying(16),
    id  integer,
    buldte  character varying(8),
    compname  character varying(128),
    maketxt  character varying(25),
    modeltxt  character varying(256),
    yeartxt  character varying(4),
    datea  character varying(8),
    summary  character varying(240)
);
DROP INDEX index_tsbs_on_make_and_model_and_year;
DROP INDEX index_tsbs_on_date;
CREATE INDEX index_tsbs_on_make_and_model_and_year ON tsbs USING btree (maketxt,modeltxt,yeartxt);
CREATE INDEX index_tsbs_on_date ON tsbs USING btree (datea);

COPY tsbs FROM 'FLAT_TSBS.txt' (FORMAT csv, DELIMITER E'\t', QUOTE U&'\007F' ENCODING 'latin1');

DROP TABLE IF EXISTS rcl;
CREATE TABLE IF NOT EXISTS rcl (
    record_id  integer,
    campno  character varying(12),
    maketxt  character varying(25),
    modeltxt  character varying(256),
    yeartxt  character varying(4),
    mfgcampno  character varying(20),
    compname  character varying(256),
    mfgname  character varying(40),
    bgman  character varying(8),
    endman  character varying(8),
    rcltypecd  character varying(4),
    potaff  integer,
    odate  character varying(8),
    influenced_by  character varying(4),
    mfgtxt  character varying(40),
    rcdate  character varying(8),
    datea  character varying(8),
    rpno  character varying(3),
    fmvss  character varying(10),
    desc_defect  text,
    consequence_defect  text,
    corrective_action text,
    notes  text,
    rcl_cmpt_id  character varying(27)
);
DROP INDEX index_rcl_on_make_and_model_and_year;
DROP INDEX index_rcl_on_date;
CREATE INDEX index_rcl_on_make_and_model_and_year ON rcl USING btree (maketxt,modeltxt,yeartxt);
CREATE INDEX index_rcl_on_date ON rcl USING btree (datea);
COPY rcl FROM 'FLAT_RCL.txt' (FORMAT csv, DELIMITER E'\t', QUOTE U&'\007F', ENCODING 'latin1');

DROP TABLE IF EXISTS cmpl;
CREATE TABLE IF NOT EXISTS cmpl (
    CMPLID            character varying(9)       ,
    ODINO             character varying(9)       ,
    MFR_NAME          character varying(40)      ,
    MAKETXT           character varying(25)      ,
    MODELTXT          character varying(256)     ,
    YEARTXT           character varying(4)       ,
    CRASH             character varying(1)       ,
    FAILDATE          character varying(8)       ,
    FIRE              character varying(1)       ,
    INJURED           integer ,
    DEATHS            integer ,
    COMPDESC          character varying(128)     ,
    CITY              character varying(30)      ,
    STATE             character varying(2)       ,
    VIN               character varying(11)      ,
    DATEA             character varying(8)       ,
    LDATE             character varying(8)       ,
    MILES             numeric ,
    OCCURENCES        integer  ,
    CDESCR            text    ,
    CMPL_TYPE         character varying(4)       ,
    POLICE_RPT_YN     character varying(1)       ,
    PURCH_DT          character varying(8)       ,
    ORIG_OWNER_YN     character varying(1)       ,
    ANTI_BRAKES_YN    character varying(1)       ,
    CRUISE_CONT_YN    character varying(1)       ,
    NUM_CYLS          integer ,
    DRIVE_TRAIN       character varying(4)       ,
    FUEL_SYS          character varying(4)       ,
    FUEL_TYPE         character varying(4)       ,
    TRANS_TYPE        character varying(4)       ,
    VEH_SPEED         integer  ,
    DOT               character varying(20)      ,
    TIRE_SIZE         character varying(30)      ,
    LOC_OF_TIRE       character varying(4)       ,
    TIRE_FAIL_TYPE    character varying(4)       ,
    ORIG_EQUIP_YN     character varying(1)       ,
    MANUF_DT          character varying(8)       ,
    SEAT_TYPE         character varying(4)       ,
    RESTRAINT_TYPE     character varying(4)       ,
    DEALER_NAME        character varying(40)      ,
    DEALER_TEL         character varying(20)      ,
    DEALER_CITY        character varying(30)      ,
    DEALER_STATE       character varying(2)       ,
    DEALER_ZIP         character varying(10)      ,
    PROD_TYPE          character varying(4)       ,
    REPAIRED_YN        character varying(1)       ,
    MEDICAL_ATTN       character varying(1)       ,
    VEHICLES_TOWED_YN  character varying(1)
);

DROP INDEX index_cmpl_on_make_and_model_and_year;
DROP INDEX index_cmpl_on_date;
COPY cmpl FROM 'FLAT_CMPL.txt' (FORMAT csv, DELIMITER E'\t', QUOTE U&'\0011', ENCODING 'latin1');
CREATE INDEX index_cmpl_on_make_and_model_and_year ON cmpl USING btree (maketxt,modeltxt,yeartxt);
CREATE INDEX index_cmpl_on_date ON cmpl USING btree (FAILDATE);

DROP TABLE IF EXISTS inv;
CREATE TABLE IF NOT EXISTS inv (
    nhtsa_action_number character varying(10),
    make  character varying(25),
    model  character varying(256),
    year character varying(4),
    compname  character varying(256),
    mfr_name  character varying(40),
    odate  character varying(8),
    cdate  character varying(8),
    campno  character varying(9),
    subject  character varying(40),
    summary text
);
DROP INDEX index_inv_on_make_and_model_and_year;
DROP INDEX index_inv_on_date;
CREATE INDEX index_inv_on_make_and_model_and_year ON inv USING btree (make,model,year);
CREATE INDEX index_inv_on_date ON inv USING btree (odate);
COPY inv FROM 'flat_inv.txt' (FORMAT csv, DELIMITER E'\t', QUOTE U&'\007F', ENCODING 'latin1');

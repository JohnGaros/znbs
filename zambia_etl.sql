/*
 Navicat Premium Data Transfer

 Source Server         : Development
 Source Server Type    : PostgreSQL
 Source Server Version : 100015
 Source Host           : 192.168.1.47:5432
 Source Catalog        : credit_ark_gr
 Source Schema         : zambia_etl

 Target Server Type    : PostgreSQL
 Target Server Version : 100015
 File Encoding         : 65001

 Date: 04/01/2021 10:51:59
*/


-- ----------------------------
-- Table structure for BankingScore
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."BankingScore";
CREATE TABLE "zambia_etl"."BankingScore" (
  "context_id" int2,
  "snapshot_date" date,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default",
  "creditark_score" varchar(255) COLLATE "pg_catalog"."default",
  "balance" float8,
  "bucket_id" int2,
  "ead" float8,
  "mitigant_type_id" int2
)
;

-- ----------------------------
-- Table structure for BankingScore_copy1
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."BankingScore_copy1";
CREATE TABLE "zambia_etl"."BankingScore_copy1" (
  "context_id" int2,
  "snapshot_date" date,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default",
  "creditark_score" varchar(255) COLLATE "pg_catalog"."default",
  "balance" float8,
  "bucket_id" int2,
  "ead" float8,
  "mitigant_type_id" int2
)
;

-- ----------------------------
-- Table structure for MortgageScore
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."MortgageScore";
CREATE TABLE "zambia_etl"."MortgageScore" (
  "context_id" int2,
  "snapshot_date" date,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default",
  "creditark_score" varchar(255) COLLATE "pg_catalog"."default",
  "balance" float8,
  "bucket_id" int2,
  "ead" float8,
  "mitigant_type_id" int2
)
;

-- ----------------------------
-- Table structure for MortgageScore_copy1
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."MortgageScore_copy1";
CREATE TABLE "zambia_etl"."MortgageScore_copy1" (
  "context_id" int2,
  "snapshot_date" date,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default",
  "creditark_score" varchar(255) COLLATE "pg_catalog"."default",
  "balance" float8,
  "bucket_id" int2,
  "ead" float8,
  "mitigant_type_id" int2
)
;

-- ----------------------------
-- Table structure for monthly_raw_data
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."monthly_raw_data";
CREATE TABLE "zambia_etl"."monthly_raw_data" (
  "context_id" int4,
  "snapshot_date" date,
  "accountno" varchar(255) COLLATE "pg_catalog"."default",
  "loantype" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default",
  "firstname" varchar(255) COLLATE "pg_catalog"."default",
  "nrc" varchar(255) COLLATE "pg_catalog"."default",
  "activedate" date,
  "Redemptiondate" date,
  "disbursedamount" float8,
  "monthlyrepayment" float8,
  "term" int8,
  "mortgagebalance" float8,
  "arrearcount" int8,
  "mortgagebalance.1" float8,
  "interestrate" float8,
  "currentrate" float8,
  "monthlyincome" float8,
  "DateofBirth" date,
  "plotno" varchar(255) COLLATE "pg_catalog"."default",
  "houseno" varchar(255) COLLATE "pg_catalog"."default",
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "area" varchar(255) COLLATE "pg_catalog"."default",
  "town" varchar(255) COLLATE "pg_catalog"."default",
  "maritalstatus" varchar(255) COLLATE "pg_catalog"."default",
  "Gender" varchar(255) COLLATE "pg_catalog"."default",
  "monthlyincome.1" float8,
  "profession" varchar(255) COLLATE "pg_catalog"."default",
  "employer" varchar(255) COLLATE "pg_catalog"."default",
  "titledeedno" varchar(255) COLLATE "pg_catalog"."default",
  "PropertyValue" float8,
  "Marketvalue" float8,
  "Product ID" varchar(255) COLLATE "pg_catalog"."default",
  "Installment Count" int8,
  "Cover Amount" float8,
  "Remaining Capital" float8
)
;

-- ----------------------------
-- Table structure for raw_data
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."raw_data";
CREATE TABLE "zambia_etl"."raw_data" (
  "snapshot_date" date,
  "category" varchar(255) COLLATE "pg_catalog"."default",
  "account_number" varchar(255) COLLATE "pg_catalog"."default",
  "product_desc" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default",
  "firstname" varchar(255) COLLATE "pg_catalog"."default",
  "nrc_no" varchar(255) COLLATE "pg_catalog"."default",
  "active_date" date,
  "redemption_date" date,
  "principle_amount" float8,
  "repayment_amount" float8,
  "term" int8,
  "loan_balance_1" float8,
  "arrears_count" int8,
  "loan_balance_2" float8,
  "interest_rate_1" float8,
  "interest_rate_2" float8,
  "monthly_income_1" float8,
  "date_of_birth" date,
  "plot_no" int8,
  "house_no" int8,
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "area" varchar(255) COLLATE "pg_catalog"."default",
  "town" varchar(255) COLLATE "pg_catalog"."default",
  "marital_status" varchar(255) COLLATE "pg_catalog"."default",
  "gender" varchar(255) COLLATE "pg_catalog"."default",
  "monthly_income_2" float8,
  "profession" varchar(255) COLLATE "pg_catalog"."default",
  "employer" varchar(255) COLLATE "pg_catalog"."default",
  "title_deed_no" varchar(255) COLLATE "pg_catalog"."default",
  "property_value" float8,
  "market_value" float8,
  "product_id" varchar(255) COLLATE "pg_catalog"."default",
  "install_count" int8,
  "cover_amount" float8,
  "remaining_capital" float8,
  "acc_status" int4,
  "loan_status" int4
)
;

-- ----------------------------
-- Table structure for raw_data_copy1
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."raw_data_copy1";
CREATE TABLE "zambia_etl"."raw_data_copy1" (
  "snapshot_date" date,
  "category" varchar(255) COLLATE "pg_catalog"."default",
  "account_number" varchar(255) COLLATE "pg_catalog"."default",
  "product_desc" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default",
  "firstname" varchar(255) COLLATE "pg_catalog"."default",
  "nrc_no" varchar(255) COLLATE "pg_catalog"."default",
  "active_date" date,
  "redemption_date" date,
  "principle_amount" float8,
  "repayment_amount" float8,
  "term" int8,
  "loan_balance_1" float8,
  "arrears_count" int8,
  "loan_balance_2" float8,
  "interest_rate_1" float8,
  "interest_rate_2" float8,
  "monthly_income_1" float8,
  "date_of_birth" date,
  "plot_no" int8,
  "house_no" int8,
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "area" varchar(255) COLLATE "pg_catalog"."default",
  "town" varchar(255) COLLATE "pg_catalog"."default",
  "marital_status" varchar(255) COLLATE "pg_catalog"."default",
  "gender" varchar(255) COLLATE "pg_catalog"."default",
  "monthly_income_2" float8,
  "profession" varchar(255) COLLATE "pg_catalog"."default",
  "employer" varchar(255) COLLATE "pg_catalog"."default",
  "title_deed_no" varchar(255) COLLATE "pg_catalog"."default",
  "property_value" float8,
  "market_value" float8,
  "product_id" varchar(255) COLLATE "pg_catalog"."default",
  "install_count" int8,
  "cover_amount" float8,
  "remaining_capital" float8,
  "acc_status" int4,
  "loan_status" int4
)
;

-- ----------------------------
-- Table structure for znbs14to19
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."znbs14to19";
CREATE TABLE "zambia_etl"."znbs14to19" (
  "PASS" varchar(255) COLLATE "pg_catalog"."default",
  "accountno" varchar(255) COLLATE "pg_catalog"."default",
  "loantype" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default",
  "firstname" varchar(255) COLLATE "pg_catalog"."default",
  "nrc" varchar(255) COLLATE "pg_catalog"."default",
  "activedate" varchar(255) COLLATE "pg_catalog"."default",
  "Redemptiondate" varchar(255) COLLATE "pg_catalog"."default",
  "principleloanamount" varchar(255) COLLATE "pg_catalog"."default",
  "expectedrepaymentamount" varchar(255) COLLATE "pg_catalog"."default",
  "term" varchar(255) COLLATE "pg_catalog"."default",
  "loanbalance" varchar(255) COLLATE "pg_catalog"."default",
  "arrearcount" varchar(255) COLLATE "pg_catalog"."default",
  "loanbalance.1" varchar(255) COLLATE "pg_catalog"."default",
  "interestrate" varchar(255) COLLATE "pg_catalog"."default",
  "interestrate.1" varchar(255) COLLATE "pg_catalog"."default",
  "monthlyincome" varchar(255) COLLATE "pg_catalog"."default",
  "DateofBirth" varchar(255) COLLATE "pg_catalog"."default",
  "plotno" varchar(255) COLLATE "pg_catalog"."default",
  "houseno" varchar(255) COLLATE "pg_catalog"."default",
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "area" varchar(255) COLLATE "pg_catalog"."default",
  "town" varchar(255) COLLATE "pg_catalog"."default",
  "maritalstatus" varchar(255) COLLATE "pg_catalog"."default",
  "Gender" varchar(255) COLLATE "pg_catalog"."default",
  "monthlyincome.1" varchar(255) COLLATE "pg_catalog"."default",
  "profession" varchar(255) COLLATE "pg_catalog"."default",
  "employer" varchar(255) COLLATE "pg_catalog"."default",
  "yearmonth" date,
  "order" varchar(255) COLLATE "pg_catalog"."default",
  "Province" varchar(255) COLLATE "pg_catalog"."default",
  "loancode" varchar(255) COLLATE "pg_catalog"."default",
  "employercode" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for znbs14to19_v2
-- ----------------------------
DROP TABLE IF EXISTS "zambia_etl"."znbs14to19_v2";
CREATE TABLE "zambia_etl"."znbs14to19_v2" (
  "PASS" varchar(255) COLLATE "pg_catalog"."default",
  "accountno" varchar(255) COLLATE "pg_catalog"."default",
  "loantype" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default",
  "firstname" varchar(255) COLLATE "pg_catalog"."default",
  "nrc" varchar(255) COLLATE "pg_catalog"."default",
  "activedate" date,
  "Redemptiondate" date,
  "principleloanamount" float8,
  "expectedrepaymentamount" float8,
  "term" int4,
  "loanbalance" float8,
  "arrearcount" int4,
  "loanbalance.1" float8,
  "interestrate" float8,
  "interestrate.1" float8,
  "monthlyincome" float8,
  "DateofBirth" date,
  "plotno" varchar(255) COLLATE "pg_catalog"."default",
  "houseno" varchar(255) COLLATE "pg_catalog"."default",
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "area" varchar(255) COLLATE "pg_catalog"."default",
  "town" varchar(255) COLLATE "pg_catalog"."default",
  "maritalstatus" varchar(255) COLLATE "pg_catalog"."default",
  "Gender" varchar(255) COLLATE "pg_catalog"."default",
  "monthlyincome.1" float8,
  "profession" varchar(255) COLLATE "pg_catalog"."default",
  "employer" varchar(255) COLLATE "pg_catalog"."default",
  "yearmonth" date,
  "Province" varchar(255) COLLATE "pg_catalog"."default",
  "order" int4,
  "loancode" varchar(255) COLLATE "pg_catalog"."default",
  "employercode" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Function structure for mitigants_set_element
-- ----------------------------
DROP FUNCTION IF EXISTS "zambia_etl"."mitigants_set_element"("mitigants" _float8, "current_exposure" float8, "mitigant_type_id" int4);
CREATE OR REPLACE FUNCTION "zambia_etl"."mitigants_set_element"("mitigants" _float8, "current_exposure" float8, "mitigant_type_id" int4)
  RETURNS "pg_catalog"."_float8" AS $BODY$
begin
    mitigants[mitigant_type_id]:= current_exposure;
    return mitigants;
end $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- View structure for v_snapshot_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_snapshot_v2";
CREATE VIEW "zambia_etl"."v_snapshot_v2" AS  SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    NULL::smallint AS customer_status_id,
    0.1 AS profit_margin,
    t2.activity,
    t3.exposure,
    t4.aging,
    t5.mitigants,
    array_fill(0, ARRAY[19]) AS criteria,
    NULL::text AS behavioral_score,
    t1.creditark_score AS credit_ark_score,
    false AS analysis_excluded,
    t4.aging AS past_due,
    array_fill(0, ARRAY[2]) AS provisions
   FROM ((((zambia_etl.v_scores_v2 t1
     JOIN zambia_etl.v_activity_v2 t2 ON (((t1.snapshot_date = t2.snapshot_date) AND ((t1.customer_id)::text = (t2.customer_id)::text))))
     JOIN zambia_etl.v_exposure_v2 t3 ON (((t1.snapshot_date = t3.snapshot_date) AND ((t1.customer_id)::text = (t3.customer_id)::text))))
     JOIN zambia_etl.v_aging_v2 t4 ON (((t1.snapshot_date = t4.snapshot_date) AND ((t1.customer_id)::text = (t4.customer_id)::text))))
     JOIN zambia_etl.v_mitigants_v2 t5 ON (((t1.snapshot_date = t5.snapshot_date) AND ((t1.customer_id)::text = (t5.customer_id)::text))));

-- ----------------------------
-- View structure for v_rest_info_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_rest_info_v2";
CREATE VIEW "zambia_etl"."v_rest_info_v2" AS  SELECT DISTINCT 20 AS context_id,
    t1.snapshot_date,
    t1.nrc_no AS nrc,
    sum(t1.principle_amount) AS principle_loan_amount_sum,
    avg(t1.arrears_count) AS arrear_avg,
    min(t1.active_date) AS activedate_min,
    min((t1.surname)::text) AS surname,
    min((t1.firstname)::text) AS firstname
   FROM zambia_etl.raw_data t1
  GROUP BY t1.snapshot_date, t1.nrc_no;

-- ----------------------------
-- View structure for v_rest_info
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_rest_info";
CREATE VIEW "zambia_etl"."v_rest_info" AS  SELECT DISTINCT max(monthly_raw_data.context_id) OVER () AS context_id,
    max(monthly_raw_data.snapshot_date) OVER () AS snapshot_date,
    monthly_raw_data.nrc,
    sum(monthly_raw_data.disbursedamount) OVER (PARTITION BY monthly_raw_data.nrc) AS principle_loan_amount_sum,
    avg(monthly_raw_data.arrearcount) OVER (PARTITION BY monthly_raw_data.nrc) AS arrear_avg,
    min(monthly_raw_data.activedate) OVER (PARTITION BY monthly_raw_data.nrc) AS activedate_min,
    first_value(monthly_raw_data.surname) OVER (PARTITION BY monthly_raw_data.nrc) AS surname,
    first_value(monthly_raw_data.firstname) OVER (PARTITION BY monthly_raw_data.nrc) AS firstname
   FROM zambia_etl.monthly_raw_data;

-- ----------------------------
-- View structure for v_activity
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_activity";
CREATE VIEW "zambia_etl"."v_activity" AS  WITH cte AS (
         SELECT DISTINCT t1_1.context_id,
            t1_1.nrc AS customer_id,
            first_value(t1_1.principle_loan_amount_sum) OVER (PARTITION BY t1_1.nrc) AS loan_principal,
            first_value(t1_1.arrear_avg) OVER (PARTITION BY t1_1.nrc) AS avg_arrear_count
           FROM ( SELECT v_rest_info.context_id,
                    v_rest_info.snapshot_date,
                    v_rest_info.nrc,
                    v_rest_info.principle_loan_amount_sum,
                    v_rest_info.arrear_avg,
                    v_rest_info.activedate_min,
                    v_rest_info.surname,
                    v_rest_info.firstname
                   FROM zambia_etl.v_rest_info) t1_1
        )
 SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    ARRAY[abs(sum(t2.loan_principal)), abs(sum(t1.balance)), (abs(sum(t2.loan_principal)) - abs(sum(t1.balance))), (avg(t2.avg_arrear_count))::double precision] AS activity
   FROM (( SELECT "BankingScore".context_id,
            "BankingScore".snapshot_date,
            "BankingScore".customer_id,
            "BankingScore".creditark_score,
            "BankingScore".balance,
            "BankingScore".ead,
            "BankingScore".mitigant_type_id
           FROM zambia_etl."BankingScore"
        UNION
         SELECT "MortgageScore".context_id,
            "MortgageScore".snapshot_date,
            "MortgageScore".customer_id,
            "MortgageScore".creditark_score,
            "MortgageScore".balance,
            "MortgageScore".ead,
            "MortgageScore".mitigant_type_id
           FROM zambia_etl."MortgageScore") t1
     JOIN cte t2 ON (((t1.customer_id)::text = (t2.customer_id)::text)))
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_activity_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_activity_v2";
CREATE VIEW "zambia_etl"."v_activity_v2" AS  SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    ARRAY[abs(sum(t2.principle_loan_amount_sum)), abs(sum(t1.balance)), (abs(sum(t2.principle_loan_amount_sum)) - abs(sum(t1.balance))), (avg(t2.arrear_avg))::double precision] AS activity
   FROM (( SELECT "BankingScore".context_id,
            "BankingScore".snapshot_date,
            "BankingScore".customer_id,
            "BankingScore".creditark_score,
            "BankingScore".balance,
            "BankingScore".bucket_id,
            "BankingScore".ead,
            "BankingScore".mitigant_type_id
           FROM zambia_etl."BankingScore"
        UNION
         SELECT "MortgageScore".context_id,
            "MortgageScore".snapshot_date,
            "MortgageScore".customer_id,
            "MortgageScore".creditark_score,
            "MortgageScore".balance,
            "MortgageScore".bucket_id,
            "MortgageScore".ead,
            "MortgageScore".mitigant_type_id
           FROM zambia_etl."MortgageScore") t1
     JOIN zambia_etl.v_rest_info_v2 t2 ON ((((t1.customer_id)::text = (t2.nrc)::text) AND (t1.snapshot_date = t2.snapshot_date))))
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_aging
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_aging";
CREATE VIEW "zambia_etl"."v_aging" AS  WITH cte1 AS (
         SELECT t1_1.context_id,
            t1_1.snapshot_date,
            t1_1.customer_id,
            t1_1.creditark_score,
            t1_1.balance,
            t1_1.bucket_id,
            t1_1.ead,
            t1_1.mitigant_type_id,
            array_fill(0, ARRAY[3]) AS aging
           FROM ( SELECT "BankingScore".context_id,
                    "BankingScore".snapshot_date,
                    "BankingScore".customer_id,
                    "BankingScore".creditark_score,
                    "BankingScore".balance,
                    "BankingScore".bucket_id,
                    "BankingScore".ead,
                    "BankingScore".mitigant_type_id
                   FROM zambia_etl."BankingScore"
                UNION
                 SELECT "MortgageScore".context_id,
                    "MortgageScore".snapshot_date,
                    "MortgageScore".customer_id,
                    "MortgageScore".creditark_score,
                    "MortgageScore".balance,
                    "MortgageScore".bucket_id,
                    "MortgageScore".ead,
                    "MortgageScore".mitigant_type_id
                   FROM zambia_etl."MortgageScore") t1_1
        ), cte2 AS (
         SELECT cte1.context_id,
            cte1.snapshot_date,
            cte1.customer_id,
            zambia_etl.mitigants_set_element((cte1.aging)::double precision[], cte1.balance, (cte1.bucket_id)::integer) AS aging
           FROM cte1
        )
 SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    array_agg(t1.elem ORDER BY t1.nr) AS aging
   FROM ( SELECT cte2.context_id,
            cte2.snapshot_date,
            cte2.customer_id,
            x.nr,
            sum(x.elem) AS elem
           FROM cte2,
            LATERAL unnest(cte2.aging) WITH ORDINALITY x(elem, nr)
          GROUP BY cte2.context_id, cte2.snapshot_date, cte2.customer_id, x.nr) t1
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_mitigants
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_mitigants";
CREATE VIEW "zambia_etl"."v_mitigants" AS  WITH cte1 AS (
         SELECT t1_1.context_id,
            t1_1.snapshot_date,
            t1_1.customer_id,
            t1_1.ead,
            t1_1.mitigant_type_id,
            array_fill(0, ARRAY[20]) AS mitigants
           FROM ( SELECT "BankingScore".context_id,
                    "BankingScore".snapshot_date,
                    "BankingScore".customer_id,
                    "BankingScore".creditark_score,
                    "BankingScore".balance,
                    "BankingScore".ead,
                    "BankingScore".mitigant_type_id
                   FROM zambia_etl."BankingScore"
                UNION
                 SELECT "MortgageScore".context_id,
                    "MortgageScore".snapshot_date,
                    "MortgageScore".customer_id,
                    "MortgageScore".creditark_score,
                    "MortgageScore".balance,
                    "MortgageScore".ead,
                    "MortgageScore".mitigant_type_id
                   FROM zambia_etl."MortgageScore") t1_1
        ), cte2 AS (
         SELECT cte1.context_id,
            cte1.snapshot_date,
            cte1.customer_id,
            zambia_etl.mitigants_set_element((cte1.mitigants)::double precision[], cte1.ead, (cte1.mitigant_type_id)::integer) AS mitigants
           FROM cte1
        )
 SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    array_agg(t1.elem ORDER BY t1.nr) AS mitigants
   FROM ( SELECT cte2.context_id,
            cte2.snapshot_date,
            cte2.customer_id,
            x.nr,
            sum(x.elem) AS elem
           FROM cte2,
            LATERAL unnest(cte2.mitigants) WITH ORDINALITY x(elem, nr)
          GROUP BY cte2.context_id, cte2.snapshot_date, cte2.customer_id, x.nr) t1
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_scores
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_scores";
CREATE VIEW "zambia_etl"."v_scores" AS  SELECT DISTINCT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    max((t1.creditark_score)::text) AS creditark_score
   FROM ( SELECT "BankingScore".context_id,
            "BankingScore".snapshot_date,
            "BankingScore".customer_id,
            "BankingScore".creditark_score,
            "BankingScore".balance,
            "BankingScore".ead,
            "BankingScore".mitigant_type_id
           FROM zambia_etl."BankingScore"
        UNION
         SELECT "MortgageScore".context_id,
            "MortgageScore".snapshot_date,
            "MortgageScore".customer_id,
            "MortgageScore".creditark_score,
            "MortgageScore".balance,
            "MortgageScore".ead,
            "MortgageScore".mitigant_type_id
           FROM zambia_etl."MortgageScore") t1
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_exposure
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_exposure";
CREATE VIEW "zambia_etl"."v_exposure" AS  SELECT v_activity.context_id,
    v_activity.snapshot_date,
    v_activity.customer_id,
    ARRAY[v_activity.activity[2], v_activity.activity[1]] AS exposure
   FROM zambia_etl.v_activity;

-- ----------------------------
-- View structure for v_snapshot
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_snapshot";
CREATE VIEW "zambia_etl"."v_snapshot" AS  SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    NULL::smallint AS customer_status_id,
    0.1 AS profit_margin,
    t2.activity,
    t3.exposure,
    t4.aging,
    t5.mitigants,
    array_fill(0, ARRAY[19]) AS criteria,
    NULL::text AS behavioral_score,
    t1.creditark_score AS credit_ark_score,
    false AS analysis_excluded,
    t4.aging AS past_due,
    array_fill(0, ARRAY[2]) AS provisions
   FROM ((((zambia_etl.v_scores t1
     JOIN zambia_etl.v_activity t2 ON (((t1.snapshot_date = t2.snapshot_date) AND ((t1.customer_id)::text = (t2.customer_id)::text))))
     JOIN zambia_etl.v_exposure t3 ON (((t1.snapshot_date = t3.snapshot_date) AND ((t1.customer_id)::text = (t3.customer_id)::text))))
     JOIN zambia_etl.v_aging t4 ON (((t1.snapshot_date = t4.snapshot_date) AND ((t1.customer_id)::text = (t4.customer_id)::text))))
     JOIN zambia_etl.v_mitigants t5 ON (((t1.snapshot_date = t5.snapshot_date) AND ((t1.customer_id)::text = (t5.customer_id)::text))));

-- ----------------------------
-- View structure for v_exposure_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_exposure_v2";
CREATE VIEW "zambia_etl"."v_exposure_v2" AS  SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    ARRAY[t1.activity[2], t1.activity[1]] AS exposure
   FROM zambia_etl.v_activity_v2 t1;

-- ----------------------------
-- View structure for v_aging_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_aging_v2";
CREATE VIEW "zambia_etl"."v_aging_v2" AS  WITH cte1 AS (
         SELECT t1_1.context_id,
            t1_1.snapshot_date,
            t1_1.customer_id,
            t1_1.creditark_score,
            t1_1.balance,
            t1_1.bucket_id,
            t1_1.ead,
            t1_1.mitigant_type_id,
            array_fill(0, ARRAY[3]) AS aging
           FROM ( SELECT "BankingScore".context_id,
                    "BankingScore".snapshot_date,
                    "BankingScore".customer_id,
                    "BankingScore".creditark_score,
                    "BankingScore".balance,
                    "BankingScore".bucket_id,
                    "BankingScore".ead,
                    "BankingScore".mitigant_type_id
                   FROM zambia_etl."BankingScore"
                UNION
                 SELECT "MortgageScore".context_id,
                    "MortgageScore".snapshot_date,
                    "MortgageScore".customer_id,
                    "MortgageScore".creditark_score,
                    "MortgageScore".balance,
                    "MortgageScore".bucket_id,
                    "MortgageScore".ead,
                    "MortgageScore".mitigant_type_id
                   FROM zambia_etl."MortgageScore") t1_1
        ), cte2 AS (
         SELECT cte1.context_id,
            cte1.snapshot_date,
            cte1.customer_id,
            zambia_etl.mitigants_set_element((cte1.aging)::double precision[], cte1.balance, (cte1.bucket_id)::integer) AS aging
           FROM cte1
        )
 SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    array_agg(t1.elem ORDER BY t1.nr) AS aging
   FROM ( SELECT cte2.context_id,
            cte2.snapshot_date,
            cte2.customer_id,
            x.nr,
            sum(x.elem) AS elem
           FROM cte2,
            LATERAL unnest(cte2.aging) WITH ORDINALITY x(elem, nr)
          GROUP BY cte2.context_id, cte2.snapshot_date, cte2.customer_id, x.nr) t1
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_customer_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_customer_v2";
CREATE VIEW "zambia_etl"."v_customer_v2" AS  WITH cte AS (
         SELECT DISTINCT 20 AS context_id,
            t1_1.nrc AS customer_id,
            first_value(t1_1.surname) OVER (PARTITION BY t1_1.nrc) AS surname,
            first_value(t1_1.firstname) OVER (PARTITION BY t1_1.nrc) AS firstname,
            1 AS portfolio_id,
            min(t1_1.activedate_min) OVER (PARTITION BY t1_1.nrc) AS customer_since
           FROM ( SELECT t1_2.context_id,
                    t1_2.snapshot_date,
                    t1_2.nrc,
                    t1_2.principle_loan_amount_sum,
                    t1_2.arrear_avg,
                    t1_2.activedate_min,
                    t1_2.surname,
                    t1_2.firstname
                   FROM zambia_etl.v_rest_info_v2 t1_2) t1_1
        )
 SELECT t1.context_id,
    t1.customer_id,
    1 AS portfolio_id,
    NULL::text AS vat_number,
    concat(upper(t1.surname), ' ', upper(t1.firstname)) AS customer_name,
    false AS affiliate,
    NULL::text AS group_id,
    NULL::text AS industry_id,
    NULL::text AS area_id,
    t1.customer_since,
    false AS optimization_excluded,
    false AS assessment_excluded
   FROM cte t1;

-- ----------------------------
-- View structure for v_mitigants_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_mitigants_v2";
CREATE VIEW "zambia_etl"."v_mitigants_v2" AS  WITH cte1 AS (
         SELECT t1_1.context_id,
            t1_1.snapshot_date,
            t1_1.customer_id,
            t1_1.ead,
            t1_1.mitigant_type_id,
            array_fill(0, ARRAY[20]) AS mitigants
           FROM ( SELECT "BankingScore".context_id,
                    "BankingScore".snapshot_date,
                    "BankingScore".customer_id,
                    "BankingScore".creditark_score,
                    "BankingScore".balance,
                    "BankingScore".bucket_id,
                    "BankingScore".ead,
                    "BankingScore".mitigant_type_id
                   FROM zambia_etl."BankingScore"
                UNION
                 SELECT "MortgageScore".context_id,
                    "MortgageScore".snapshot_date,
                    "MortgageScore".customer_id,
                    "MortgageScore".creditark_score,
                    "MortgageScore".balance,
                    "MortgageScore".bucket_id,
                    "MortgageScore".ead,
                    "MortgageScore".mitigant_type_id
                   FROM zambia_etl."MortgageScore") t1_1
        ), cte2 AS (
         SELECT cte1.context_id,
            cte1.snapshot_date,
            cte1.customer_id,
            zambia_etl.mitigants_set_element((cte1.mitigants)::double precision[], cte1.ead, (cte1.mitigant_type_id)::integer) AS mitigants
           FROM cte1
        )
 SELECT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    array_agg(t1.elem ORDER BY t1.nr) AS mitigants
   FROM ( SELECT cte2.context_id,
            cte2.snapshot_date,
            cte2.customer_id,
            x.nr,
            sum(x.elem) AS elem
           FROM cte2,
            LATERAL unnest(cte2.mitigants) WITH ORDINALITY x(elem, nr)
          GROUP BY cte2.context_id, cte2.snapshot_date, cte2.customer_id, x.nr) t1
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;

-- ----------------------------
-- View structure for v_customer
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_customer";
CREATE VIEW "zambia_etl"."v_customer" AS  WITH cte AS (
         SELECT DISTINCT 20 AS context_id,
            t1_1.nrc AS customer_id,
            first_value(t1_1.surname) OVER (PARTITION BY t1_1.nrc) AS surname,
            first_value(t1_1.firstname) OVER (PARTITION BY t1_1.nrc) AS firstname,
            1 AS portfolio_id,
            min(t1_1.activedate_min) OVER (PARTITION BY t1_1.nrc) AS customer_since
           FROM ( SELECT v_rest_info.context_id,
                    v_rest_info.snapshot_date,
                    v_rest_info.nrc,
                    v_rest_info.principle_loan_amount_sum,
                    v_rest_info.arrear_avg,
                    v_rest_info.activedate_min,
                    v_rest_info.surname,
                    v_rest_info.firstname
                   FROM zambia_etl.v_rest_info) t1_1
        )
 SELECT t1.context_id,
    t1.customer_id,
    1 AS portfolio_id,
    NULL::text AS vat_number,
    concat(upper((t1.surname)::text), ' ', upper((t1.firstname)::text)) AS customer_name,
    false AS affiliate,
    NULL::text AS group_id,
    NULL::text AS industry_id,
    NULL::text AS area_id,
    t1.customer_since,
    false AS optimization_excluded,
    false AS assessment_excluded
   FROM cte t1;

-- ----------------------------
-- View structure for v_scores_v2
-- ----------------------------
DROP VIEW IF EXISTS "zambia_etl"."v_scores_v2";
CREATE VIEW "zambia_etl"."v_scores_v2" AS  SELECT DISTINCT t1.context_id,
    t1.snapshot_date,
    t1.customer_id,
    max((t1.creditark_score)::text) AS creditark_score
   FROM ( SELECT "BankingScore".context_id,
            "BankingScore".snapshot_date,
            "BankingScore".customer_id,
            "BankingScore".creditark_score,
            "BankingScore".balance,
            "BankingScore".bucket_id,
            "BankingScore".ead,
            "BankingScore".mitigant_type_id
           FROM zambia_etl."BankingScore"
        UNION
         SELECT "MortgageScore".context_id,
            "MortgageScore".snapshot_date,
            "MortgageScore".customer_id,
            "MortgageScore".creditark_score,
            "MortgageScore".balance,
            "MortgageScore".bucket_id,
            "MortgageScore".ead,
            "MortgageScore".mitigant_type_id
           FROM zambia_etl."MortgageScore") t1
  GROUP BY t1.context_id, t1.snapshot_date, t1.customer_id;


-- 1. import BankingScore
-- 2. import MortgageScore
-- 3. import raw_data

update raw_data set nrc_no = rtrim(nrc_no);

delete from raw_data where nrc_no is null;

----------------------------------------

insert into d_znbs.d_customer
select * from zambia_etl.v_customer_v2
on conflict do nothing;

-----------------------------------------

insert into d_znbs.d_snapshot
select * from zambia_etl.v_snapshot_v2;

----------------------------------------

delete from d_znbs.p_snapshot_stats;

insert into d_znbs.p_snapshot_stats
select * from d_znbs.v_snapshot_stats_ecl;

-----------------------------------------


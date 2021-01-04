/*
 Navicat Premium Data Transfer

 Source Server         : Development
 Source Server Type    : PostgreSQL
 Source Server Version : 100015
 Source Host           : 192.168.1.47:5432
 Source Catalog        : credit_ark_gr
 Source Schema         : d_znbs

 Target Server Type    : PostgreSQL
 Target Server Version : 100015
 File Encoding         : 65001

 Date: 04/01/2021 10:51:27
*/


-- ----------------------------
-- Sequence structure for d_scenario_scenario_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "d_znbs"."d_scenario_scenario_id_seq";
CREATE SEQUENCE "d_znbs"."d_scenario_scenario_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for d_customer
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_customer";
CREATE TABLE "d_znbs"."d_customer" (
  "context_id" int2 NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "vat_number" varchar(20) COLLATE "pg_catalog"."default",
  "customer_name" varchar(100) COLLATE "pg_catalog"."default",
  "affiliate" bool,
  "group_id" varchar(16) COLLATE "pg_catalog"."default",
  "industry_id" varchar(32) COLLATE "pg_catalog"."default",
  "area_id" varchar(32) COLLATE "pg_catalog"."default",
  "customer_since" date,
  "optimization_excluded" bool,
  "assessment_excluded" bool
)
;

-- ----------------------------
-- Table structure for d_customer_copy1
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_customer_copy1";
CREATE TABLE "d_znbs"."d_customer_copy1" (
  "context_id" int2 NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "vat_number" varchar(20) COLLATE "pg_catalog"."default",
  "customer_name" varchar(100) COLLATE "pg_catalog"."default",
  "affiliate" bool,
  "group_id" varchar(16) COLLATE "pg_catalog"."default",
  "industry_id" varchar(32) COLLATE "pg_catalog"."default",
  "area_id" varchar(32) COLLATE "pg_catalog"."default",
  "customer_since" date,
  "optimization_excluded" bool,
  "assessment_excluded" bool
)
;

-- ----------------------------
-- Table structure for d_customer_results
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_customer_results";
CREATE TABLE "d_znbs"."d_customer_results" (
  "scenario_id" int4 NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "turnover" float8,
  "projected_turnover" float8,
  "max_limit" float8,
  "current_limit" float8,
  "proposed_limit" float8,
  "pd" float8,
  "lgd" float8,
  "funding_cost" float8,
  "working_capital" float8,
  "rw_margin" float8,
  "profit_margin" float8
)
;

-- ----------------------------
-- Table structure for d_ext_assessment
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_ext_assessment";
CREATE TABLE "d_znbs"."d_ext_assessment" (
  "context_id" int2 NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "assessment_date" date NOT NULL,
  "assessment" varchar(12) COLLATE "pg_catalog"."default",
  "entity_info" varchar(100)[] COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for d_group
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_group";
CREATE TABLE "d_znbs"."d_group" (
  "context_id" int2 NOT NULL,
  "group_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "group_name" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for d_model
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_model";
CREATE TABLE "d_znbs"."d_model" (
  "context_id" int2 NOT NULL,
  "model_id" int2 NOT NULL,
  "effective_date" date NOT NULL,
  "criteria_ord" int2[],
  "weights" float8[],
  "sector_criteria_ord" int4[],
  "sector_criteria_mask" varchar[] COLLATE "pg_catalog"."default",
  "bounds" float8[]
)
;

-- ----------------------------
-- Table structure for d_optimizer_params
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_optimizer_params";
CREATE TABLE "d_znbs"."d_optimizer_params" (
  "context_id" int2 NOT NULL,
  "ref_date" date NOT NULL,
  "turnover_days" int2,
  "var_multiplier" float8
)
;

-- ----------------------------
-- Table structure for d_portfolio
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_portfolio";
CREATE TABLE "d_znbs"."d_portfolio" (
  "context_id" int2 NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "descr" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for d_prospect_results
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_prospect_results";
CREATE TABLE "d_znbs"."d_prospect_results" (
  "scenario_id" int4 NOT NULL,
  "prospect_id" int2 NOT NULL,
  "projected_turnover" float8,
  "max_limit" float8,
  "proposed_limit" float8,
  "pd" float8,
  "lgd" float8,
  "funding_cost" float8,
  "working_capital" float8,
  "rw_margin" float8,
  "profit_margin" float8
)
;

-- ----------------------------
-- Table structure for d_qualitative_data
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_qualitative_data";
CREATE TABLE "d_znbs"."d_qualitative_data" (
  "context_id" int2,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default",
  "snapshot_date" date,
  "qualitative_score" varchar(12) COLLATE "pg_catalog"."default",
  "data_trunk" float8[]
)
;

-- ----------------------------
-- Table structure for d_scenario
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_scenario";
CREATE TABLE "d_znbs"."d_scenario" (
  "scenario_id" int4 NOT NULL DEFAULT nextval('"d_znbs".d_scenario_scenario_id_seq'::regclass),
  "valid_result" bool NOT NULL DEFAULT false,
  "context_id" int2 NOT NULL,
  "snapshot_date" date NOT NULL,
  "current_owner" varchar(32) COLLATE "pg_catalog"."default",
  "locked" bool DEFAULT false,
  "descr" varchar(50) COLLATE "pg_catalog"."default",
  "wacc" float8 NOT NULL DEFAULT 8,
  "raroc" float8 NOT NULL DEFAULT 15,
  "credit_amount" float8 NOT NULL DEFAULT 0,
  "significant_digits" int4,
  "min_limit" float8,
  "worst_accepted_score" varchar(12) COLLATE "pg_catalog"."default",
  "max_limit_growth" float8,
  "max_limit_reduction" float8,
  "min_limit_growth" float8,
  "min_limit_reduction" float8,
  "min_accepted_limit_use" float8,
  "max_dso" int4,
  "min_accepted_rw_margin" float8 NOT NULL DEFAULT 0,
  "sales_change" float8,
  "margin_change" float8,
  "pd_change" float8,
  "user_comments" varchar(2000) COLLATE "pg_catalog"."default",
  "min_limit_pct" float8
)
;

-- ----------------------------
-- Table structure for d_scenario_customer
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_scenario_customer";
CREATE TABLE "d_znbs"."d_scenario_customer" (
  "scenario_id" int4 NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "max_limit_growth" float8,
  "max_limit_reduction" float8,
  "min_limit_growth" float8,
  "min_limit_reduction" float8,
  "min_accepted_limit_use" float8,
  "max_dso" int4,
  "min_accepted_rw_margin" float8,
  "sales_change" float8,
  "margin_change" float8,
  "pd_change" float8,
  "user_comments" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for d_scenario_default_params
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_scenario_default_params";
CREATE TABLE "d_znbs"."d_scenario_default_params" (
  "context_id" int2 NOT NULL,
  "ref_date" date NOT NULL,
  "raroc" float8,
  "wacc" float8,
  "worst_accepted_score" varchar COLLATE "pg_catalog"."default",
  "max_dso" int4,
  "min_accepted_limit_use" float8,
  "max_limit_growth" float8,
  "max_limit_reduction" float8,
  "min_limit_growth" float8,
  "min_limit_reduction" float8,
  "significant_digits" int4,
  "min_limit" float8,
  "min_limit_pct" float8,
  "min_accepted_rwm" float8
)
;

-- ----------------------------
-- Table structure for d_scenario_portfolio
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_scenario_portfolio";
CREATE TABLE "d_znbs"."d_scenario_portfolio" (
  "scenario_id" int4 NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "max_limit_growth" float8,
  "max_limit_reduction" float8,
  "min_limit_growth" float8,
  "min_limit_reduction" float8,
  "min_accepted_limit_use" float8,
  "max_dso" int4,
  "min_accepted_rw_margin" float8,
  "sales_change" float8,
  "margin_change" float8,
  "pd_change" float8,
  "user_comments" varchar(2000) COLLATE "pg_catalog"."default",
  "worst_accepted_score" varchar(12) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for d_scenario_prospect
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_scenario_prospect";
CREATE TABLE "d_znbs"."d_scenario_prospect" (
  "scenario_id" int4 NOT NULL,
  "prospect_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default",
  "customers" int2,
  "purchases" float8,
  "max_dso" int4,
  "grade_id" int2,
  "profit_margin" float8,
  "credit_mitigants" float8[],
  "min_accepted_rw_margin" float8,
  "user_comments" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for d_snapshot
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_snapshot";
CREATE TABLE "d_znbs"."d_snapshot" (
  "context_id" int2 NOT NULL,
  "snapshot_date" date NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_status_id" int2,
  "profit_margin" float8,
  "activity" float8[],
  "exposure" float8[],
  "aging" float8[],
  "mitigants" float8[],
  "criteria" float8[],
  "behavioral_score" varchar(1200) COLLATE "pg_catalog"."default",
  "credit_ark_score" varchar(1200) COLLATE "pg_catalog"."default",
  "analysis_excluded" bool NOT NULL DEFAULT false,
  "past_due" float8[],
  "provisions" float8[] DEFAULT '{0}'::double precision[]
)
;

-- ----------------------------
-- Table structure for d_snapshot_copy1
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_snapshot_copy1";
CREATE TABLE "d_znbs"."d_snapshot_copy1" (
  "context_id" int2 NOT NULL,
  "snapshot_date" date NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_status_id" int2,
  "profit_margin" float8,
  "activity" float8[],
  "exposure" float8[],
  "aging" float8[],
  "mitigants" float8[],
  "criteria" float8[],
  "behavioral_score" varchar(1200) COLLATE "pg_catalog"."default",
  "credit_ark_score" varchar(1200) COLLATE "pg_catalog"."default",
  "analysis_excluded" bool NOT NULL DEFAULT false,
  "past_due" float8[],
  "provisions" float8[] DEFAULT '{0}'::double precision[]
)
;

-- ----------------------------
-- Table structure for d_snapshot_settlements
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_snapshot_settlements";
CREATE TABLE "d_znbs"."d_snapshot_settlements" (
  "context_id" int2 NOT NULL,
  "snapshot_date" date NOT NULL,
  "customer_id" varchar(20) COLLATE "pg_catalog"."default",
  "settlements_balance" float8,
  "settlements_payments" float8
)
;

-- ----------------------------
-- Table structure for d_user_default_params
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."d_user_default_params";
CREATE TABLE "d_znbs"."d_user_default_params" (
  "context_id" int2 NOT NULL,
  "comparison_period" int2,
  "amount_divisor" float8
)
;

-- ----------------------------
-- Table structure for m_activity
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_activity";
CREATE TABLE "d_znbs"."m_activity" (
  "context_id" int2 NOT NULL,
  "activity_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for m_area
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_area";
CREATE TABLE "d_znbs"."m_area" (
  "context_id" int2 NOT NULL,
  "area_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for m_assessment_grade
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_assessment_grade";
CREATE TABLE "d_znbs"."m_assessment_grade" (
  "context_id" int2 NOT NULL,
  "scale_id" int2 NOT NULL,
  "grade_id" int2 NOT NULL,
  "grade_descr" varchar(20) COLLATE "pg_catalog"."default",
  "pd" float8
)
;

-- ----------------------------
-- Table structure for m_bucket
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_bucket";
CREATE TABLE "d_znbs"."m_bucket" (
  "context_id" int2 NOT NULL,
  "bucket_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for m_criterion
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_criterion";
CREATE TABLE "d_znbs"."m_criterion" (
  "context_id" int2 NOT NULL,
  "model_type" int2 NOT NULL,
  "criterion_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default",
  "discrete_values" varchar(50)[] COLLATE "pg_catalog"."default",
  "data_type" int4
)
;

-- ----------------------------
-- Table structure for m_customer_status
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_customer_status";
CREATE TABLE "d_znbs"."m_customer_status" (
  "context_id" int2 NOT NULL,
  "customer_status_id" int2 NOT NULL,
  "descr" varchar(30) COLLATE "pg_catalog"."default",
  "portfolio_excluded" bool
)
;

-- ----------------------------
-- Table structure for m_entity_info
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_entity_info";
CREATE TABLE "d_znbs"."m_entity_info" (
  "context_id" int2 NOT NULL,
  "entity_info_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default",
  "format" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'NR'::character varying
)
;
COMMENT ON COLUMN "d_znbs"."m_entity_info"."format" IS '1st character: N = Normal row format, H = Header row, T = Total row
2nd character: L = Left aligned, R = Right aligned
3rd character: S = String, A = Amount, P = Percentage, D = Date
';

-- ----------------------------
-- Table structure for m_exposure
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_exposure";
CREATE TABLE "d_znbs"."m_exposure" (
  "context_id" int2 NOT NULL,
  "exposure_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for m_industry
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_industry";
CREATE TABLE "d_znbs"."m_industry" (
  "context_id" int2 NOT NULL,
  "industry_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for m_mitigant
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_mitigant";
CREATE TABLE "d_znbs"."m_mitigant" (
  "context_id" int2 NOT NULL,
  "mitigant_type_id" int2 NOT NULL,
  "descr" varchar(50) COLLATE "pg_catalog"."default",
  "recovery_rate" float8
)
;

-- ----------------------------
-- Table structure for m_score
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."m_score";
CREATE TABLE "d_znbs"."m_score" (
  "context_id" int2 NOT NULL,
  "score_id" int2 NOT NULL,
  "score" varchar(12) COLLATE "pg_catalog"."default",
  "pd" float8,
  "pd_life" float8
)
;

-- ----------------------------
-- Table structure for p_scenario_stats
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."p_scenario_stats";
CREATE TABLE "d_znbs"."p_scenario_stats" (
  "scenario_id" int4 NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "score" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "customers" int4,
  "turnover" float8,
  "projected_turnover" float8,
  "current_limit" float8,
  "proposed_limit" float8,
  "funding_cost" float8,
  "profit_margin" float8,
  "mean_rwm" float8,
  "proposed_provisions" float8,
  "proposed_wc" float8
)
;

-- ----------------------------
-- Table structure for p_snapshot_stats
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."p_snapshot_stats";
CREATE TABLE "d_znbs"."p_snapshot_stats" (
  "context_id" int2 NOT NULL,
  "snapshot_date" date NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "score" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "customers" int4,
  "sales" float8,
  "vat" float8,
  "payments" float8,
  "balance" float8,
  "limits" float8,
  "overrides" float8,
  "unused_limits" float8,
  "past_due_amount" float8
)
;

-- ----------------------------
-- Table structure for p_snapshot_stats_copy1
-- ----------------------------
DROP TABLE IF EXISTS "d_znbs"."p_snapshot_stats_copy1";
CREATE TABLE "d_znbs"."p_snapshot_stats_copy1" (
  "context_id" int2 NOT NULL,
  "snapshot_date" date NOT NULL,
  "portfolio_id" int2 NOT NULL,
  "score" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "customers" int4,
  "sales" float8,
  "vat" float8,
  "payments" float8,
  "balance" float8,
  "limits" float8,
  "overrides" float8,
  "unused_limits" float8,
  "past_due_amount" float8
)
;

-- ----------------------------
-- Function structure for clientele_ifrs9_ecl
-- ----------------------------
DROP FUNCTION IF EXISTS "d_znbs"."clientele_ifrs9_ecl"("p_snapshot_date" date, "p_customer_id" varchar);
CREATE OR REPLACE FUNCTION "d_znbs"."clientele_ifrs9_ecl"("p_snapshot_date" date, "p_customer_id" varchar)
  RETURNS TABLE("secured_by" varchar, "exposure" float8, "lgd" float8, "loss_severity" float8, "ecl" numeric) AS $BODY$

BEGIN

return query

with cte as (
select t1.snapshot_date, 
t1.customer_id, 
t3.portfolio_id,
t1.exposure[1] as balance,
t1.mitigants,
t2.pd_life as pd,
greatest((t1.exposure[1]-sum(y)),0) as uncovered,
greatest((t1.exposure[1]-sum(x*y)), 0) as total_loss_severity,
coalesce(greatest((t1.exposure[1]-(sum(x*y) + (greatest((t1.exposure[1]-sum(y)),0))*t4.recovery_rate)), 0)/nullif(t1.exposure[1], 0), 0) as lgd
from 
d_elpe.m_score t2 inner join
d_elpe.d_snapshot t1 on t1.credit_ark_score = t2.score
inner join d_elpe.d_customer t3 on t1.customer_id = t3.customer_id
,lateral unnest (
(select distinct array(select recovery_rate from d_elpe.m_mitigant where mitigant_type_id != 0 order by mitigant_type_id)
from d_elpe.m_mitigant), 
t1.mitigants
) as t(x,y),
d_elpe.m_mitigant as t4
where 
t1.customer_id = p_customer_id
and 
t1.snapshot_date = p_snapshot_date --or EXTRACT(MONTH from t1.snapshot_date) in ('3', '6', '9', '12'))
and t4.mitigant_type_id = 0
group by t1.snapshot_date, t1.customer_id, t1.exposure[1], t2.pd_life, t3.portfolio_id, t1.mitigants, t4.recovery_rate
order by t1.customer_id asc, t1.snapshot_date desc
)

select 
t1.descr as secured_by,
t2.uncovered as exposure,
(1 - t1.recovery_rate) as lgd,
round((t2.uncovered*t1.recovery_rate)::numeric, 2) as loss_severity,
round((t2.pd*t2.uncovered*(1-t1.recovery_rate))::numeric, 2) as ecl
from d_elpe.m_mitigant t1, cte t2
where t1.mitigant_type_id = 0

union all

select
t1.descr as secured_by,
t2.mitigants[t1.mitigant_type_id] as exposure,
1 - t1.recovery_rate as lgd,
t2.mitigants[t1.mitigant_type_id]*t1.recovery_rate as loss_severity,
round((t2.pd*t2.mitigants[t1.mitigant_type_id]*(1 - t1.recovery_rate))::numeric, 2) as ecl
from d_elpe.m_mitigant t1, cte as t2
where t1.mitigant_type_id != 0
--order by t1.mitigant_type_id asc

union all

select
'Totals' as secured_by,
t1.balance as exposure,
round(t1.lgd::numeric, 2) as lgd,
t1.total_loss_severity as loss_severity,
round(greatest((t1.balance*t1.pd*t1.lgd)::numeric, 0), 4) as ecl
from cte t1
;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for multiply_records
-- ----------------------------
DROP FUNCTION IF EXISTS "d_znbs"."multiply_records"("multiplication_factor" int8);
CREATE OR REPLACE FUNCTION "d_znbs"."multiply_records"("multiplication_factor" int8)
  RETURNS "pg_catalog"."void" AS $BODY$
DECLARE
counter INTEGER := 0;
BEGIN
	IF (multiplication_factor < 1) THEN
		RETURN; 
	END IF; 

LOOP
EXIT WHEN counter = multiplication_factor;
counter := counter + 1;

insert into d_customer
select
context_id,
customer_id || '_' || counter::varchar,
portfolio_id,
vat_number,
customer_name,
affiliate,
group_id,
industry_id,
area_id,
customer_since,
optimization_excluded,
assessment_excluded
from d_customer;

insert into d_qualitative_data
select 
context_id,
customer_id || '_' || counter::varchar,
snapshot_date,
qualitative_score,
data_trunk
from d_qualitative_data;

insert into d_snapshot
select
context_id,
snapshot_date,
customer_id || '_' || counter::varchar,
customer_status_id,
profit_margin,
activity,
exposure,
aging,
mitigants,
criteria,
behavioral_score,
credit_ark_score,
analysis_excluded,
past_due,
provisions
from d_snapshot;

END LOOP;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for sum_ytd
-- ----------------------------
DROP FUNCTION IF EXISTS "d_znbs"."sum_ytd"("p_snapshot_date" date, "agg_var" float8, "p_customer" varchar);
CREATE OR REPLACE FUNCTION "d_znbs"."sum_ytd"("p_snapshot_date" date, "agg_var" float8, "p_customer" varchar)
  RETURNS "pg_catalog"."float8" AS $BODY$
DECLARE
begin_year float := date_trunc('year', p_snapshot_date);

BEGIN
--return query
return sum(agg_var) filter (where snapshot_date >= begin_year) over (partition by p_customer);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for sum_ytd_new
-- ----------------------------
DROP FUNCTION IF EXISTS "d_znbs"."sum_ytd_new"("p_snapshot_date" date, "agg_var" float8, "p_customer" varchar);
CREATE OR REPLACE FUNCTION "d_znbs"."sum_ytd_new"("p_snapshot_date" date, "agg_var" float8, "p_customer" varchar)
  RETURNS "pg_catalog"."float8" AS $BODY$
DECLARE
output_ytd float8;
BEGIN

with cte as (
select customer_id, snapshot_date,
sum(agg_var) over (partition by customer_id, date_trunc('year', snapshot_date) order by snapshot_date asc) as agg_ytd
from d_snapshot
--order by customer_id asc, snapshot_date desc
)
select agg_ytd 
into output_ytd

from cte
where 
customer_id = p_customer and snapshot_date = p_snapshot_date;

return output_ytd;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- View structure for v_valid_customers
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_valid_customers";
CREATE VIEW "d_znbs"."v_valid_customers" AS  WITH cte AS (
         SELECT znbs14to19.nrc,
            count(DISTINCT znbs14to19.accountno) AS acc_count,
            count(DISTINCT znbs14to19.surname) AS surname_count,
            count(DISTINCT znbs14to19.firstname) AS firstname_count
           FROM zambia_etl.znbs14to19
          GROUP BY znbs14to19.nrc
        )
 SELECT cte.nrc
   FROM cte
  WHERE ((cte.surname_count = 1) AND (cte.firstname_count = 1));

-- ----------------------------
-- View structure for v_snapshot
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_snapshot";
CREATE VIEW "d_znbs"."v_snapshot" AS  SELECT d_snapshot.context_id,
    d_snapshot.snapshot_date,
    d_snapshot.customer_id,
    d_snapshot.customer_status_id,
    d_snapshot.profit_margin,
    d_snapshot.activity,
    d_snapshot.exposure,
    d_snapshot.aging,
    d_snapshot.mitigants,
    d_snapshot.criteria,
    d_snapshot.behavioral_score,
    d_snapshot.credit_ark_score,
    d_snapshot.analysis_excluded,
    d_snapshot.provisions,
    d_snapshot.past_due,
    d_snapshot.activity[1] AS sales,
    0 AS vat,
    d_snapshot.activity[1] AS turnover,
    d_snapshot.activity[3] AS payments,
    d_snapshot.exposure[1] AS balance,
    d_snapshot.exposure[2] AS credit_limit,
    get_sum(d_snapshot.past_due) AS past_dues
   FROM d_znbs.d_snapshot;

-- ----------------------------
-- View structure for v_snapshot_stats
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_snapshot_stats";
CREATE VIEW "d_znbs"."v_snapshot_stats" AS  SELECT t1.context_id,
    t1.snapshot_date,
    t3.portfolio_id,
    t1.credit_ark_score AS score,
    count(*) AS customers,
    COALESCE(sum(t1.activity[1]), (0)::double precision) AS sales,
    0 AS vat,
    COALESCE(sum(t1.activity[3]), (0)::double precision) AS payments,
    sum(t1.exposure[1]) AS balance,
    sum(t1.exposure[2]) AS limits,
    sum(GREATEST((t1.exposure[1] - t1.exposure[2]), (0)::double precision)) AS overrides,
    sum(GREATEST((t1.exposure[2] - t1.exposure[1]), (0)::double precision)) AS unused_limits,
    sum(t2.unnest_past_due) AS past_due_amount
   FROM ((d_znbs.d_snapshot t1
     JOIN ( SELECT d_snapshot.context_id,
            d_snapshot.snapshot_date,
            d_snapshot.customer_id,
            unnest(d_snapshot.past_due) AS unnest_past_due
           FROM d_znbs.d_snapshot) t2 ON (((t1.context_id = t2.context_id) AND (t1.snapshot_date = t2.snapshot_date) AND ((t1.customer_id)::text = (t2.customer_id)::text))))
     JOIN d_znbs.d_customer t3 ON (((t1.context_id = t3.context_id) AND ((t1.customer_id)::text = (t3.customer_id)::text))))
  GROUP BY t1.context_id, t1.snapshot_date, t3.portfolio_id, t1.credit_ark_score;

-- ----------------------------
-- View structure for v_invalid_customers
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_invalid_customers";
CREATE VIEW "d_znbs"."v_invalid_customers" AS  WITH cte AS (
         SELECT t1.nrc,
            count(DISTINCT t1.accountno) AS acc_count,
            count(DISTINCT t1.surname) AS surname_count,
            count(DISTINCT t1.firstname) AS firstname_count
           FROM zambia_etl.znbs14to19_v2 t1
          GROUP BY t1.nrc
        )
 SELECT cte.nrc
   FROM cte
  WHERE ((cte.surname_count > 1) OR (cte.firstname_count > 1));

-- ----------------------------
-- View structure for v_customer_ecl
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_customer_ecl";
CREATE VIEW "d_znbs"."v_customer_ecl" AS  SELECT t1.snapshot_date,
    t1.customer_id,
    t2.pd_life,
    sum((t.x * t.y)) AS loss_severity,
    (sum((t.x * t.y)) * t2.pd_life) AS ecl
   FROM (d_znbs.d_snapshot t1
     JOIN d_znbs.m_score t2 ON (((t1.credit_ark_score)::text = (t2.score)::text))),
    LATERAL UNNEST(t1.mitigants, ARRAY( SELECT ((1)::double precision - m_mitigant.recovery_rate)
           FROM d_znbs.m_mitigant
          WHERE (m_mitigant.mitigant_type_id <> 0)
          ORDER BY m_mitigant.mitigant_type_id)) t(x, y)
  GROUP BY t1.snapshot_date, t1.customer_id, t2.pd_life;

-- ----------------------------
-- View structure for v_snapshot_stats_v2
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_snapshot_stats_v2";
CREATE VIEW "d_znbs"."v_snapshot_stats_v2" AS  SELECT t1.context_id,
    t1.snapshot_date,
    t3.portfolio_id,
    t1.credit_ark_score AS score,
    count(*) AS customers,
    COALESCE(sum(t1.activity[1]), (0)::double precision) AS sales,
    0 AS vat,
    COALESCE(sum(t1.activity[3]), (0)::double precision) AS payments,
    sum(t1.exposure[1]) AS balance,
    sum(t1.exposure[2]) AS limits,
    sum(GREATEST((t1.exposure[1] - t1.exposure[2]), (0)::double precision)) AS overrides,
    sum(GREATEST((t1.exposure[2] - t1.exposure[1]), (0)::double precision)) AS unused_limits,
    ( SELECT sum(t5.t5) AS sum
           FROM unnest(t1.past_due) t5(t5)) AS past_due_amount
   FROM (d_znbs.d_snapshot t1
     JOIN d_znbs.d_customer t3 ON (((t1.context_id = t3.context_id) AND ((t1.customer_id)::text = (t3.customer_id)::text))))
  GROUP BY t1.context_id, t1.snapshot_date, t3.portfolio_id, t1.credit_ark_score, t1.past_due;

-- ----------------------------
-- View structure for v_snapshot_stats_v3
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_snapshot_stats_v3";
CREATE VIEW "d_znbs"."v_snapshot_stats_v3" AS  WITH cte AS (
         SELECT t1.context_id,
            t1.snapshot_date,
            t3.portfolio_id,
            t1.credit_ark_score AS score,
            count(*) AS customers,
            COALESCE(sum(t1.activity[1]), (0)::double precision) AS sales,
            0 AS vat,
            COALESCE(sum(t1.activity[3]), (0)::double precision) AS payments,
            sum(t1.exposure[1]) AS balance,
            sum(t1.exposure[2]) AS limits,
            sum(GREATEST((t1.exposure[1] - t1.exposure[2]), (0)::double precision)) AS overrides,
            sum(GREATEST((t1.exposure[2] - t1.exposure[1]), (0)::double precision)) AS unused_limits,
            ( SELECT sum(t5.t5) AS sum
                   FROM unnest(t1.past_due) t5(t5)) AS past_due_amount
           FROM (d_znbs.d_snapshot t1
             JOIN d_znbs.d_customer t3 ON (((t1.context_id = t3.context_id) AND ((t1.customer_id)::text = (t3.customer_id)::text))))
          GROUP BY t1.context_id, t1.snapshot_date, t3.portfolio_id, t1.credit_ark_score, t1.past_due
        )
 SELECT cte.context_id,
    cte.snapshot_date,
    cte.portfolio_id,
    cte.score,
    sum(cte.customers) AS customers,
    sum(cte.sales) AS sales,
    sum(cte.vat) AS vat,
    sum(cte.payments) AS payments,
    sum(cte.balance) AS balance,
    sum(cte.limits) AS limits,
    sum(cte.overrides) AS overrides,
    sum(cte.unused_limits) AS unused_limits,
    sum(cte.past_due_amount) AS past_due_amount
   FROM cte
  GROUP BY cte.context_id, cte.snapshot_date, cte.portfolio_id, cte.score;

-- ----------------------------
-- View structure for v_snapshot_stats_ecl
-- ----------------------------
DROP VIEW IF EXISTS "d_znbs"."v_snapshot_stats_ecl";
CREATE VIEW "d_znbs"."v_snapshot_stats_ecl" AS  WITH cte AS (
         SELECT t1.context_id,
            t1.snapshot_date,
            t3.portfolio_id,
            t1.credit_ark_score AS score,
            count(*) AS customers,
            COALESCE(sum(t1.activity[1]), (0)::double precision) AS sales,
            sum(t4.ecl) AS vat,
            COALESCE(sum(t1.activity[3]), (0)::double precision) AS payments,
            sum(t1.exposure[1]) AS balance,
            sum(t1.exposure[2]) AS limits,
            sum(GREATEST((t1.exposure[1] - t1.exposure[2]), (0)::double precision)) AS overrides,
            sum(GREATEST((t1.exposure[2] - t1.exposure[1]), (0)::double precision)) AS unused_limits,
            ( SELECT sum(t5.t5) AS sum
                   FROM unnest(t1.past_due) t5(t5)) AS past_due_amount
           FROM ((d_znbs.d_snapshot t1
             JOIN d_znbs.d_customer t3 ON (((t1.context_id = t3.context_id) AND ((t1.customer_id)::text = (t3.customer_id)::text))))
             JOIN d_znbs.v_customer_ecl t4 ON (((t1.snapshot_date = t4.snapshot_date) AND ((t1.customer_id)::text = (t4.customer_id)::text))))
          GROUP BY t1.context_id, t1.snapshot_date, t3.portfolio_id, t1.credit_ark_score, t1.past_due
        )
 SELECT cte.context_id,
    cte.snapshot_date,
    cte.portfolio_id,
    cte.score,
    sum(cte.customers) AS customers,
    sum(cte.sales) AS sales,
    sum(cte.vat) AS vat,
    sum(cte.payments) AS payments,
    sum(cte.balance) AS balance,
    sum(cte.limits) AS limits,
    sum(cte.overrides) AS overrides,
    sum(cte.unused_limits) AS unused_limits,
    sum(cte.past_due_amount) AS past_due_amount
   FROM cte
  GROUP BY cte.context_id, cte.snapshot_date, cte.portfolio_id, cte.score;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "d_znbs"."d_scenario_scenario_id_seq"
OWNED BY "d_znbs"."d_scenario"."scenario_id";
SELECT setval('"d_znbs"."d_scenario_scenario_id_seq"', 36, true);

-- ----------------------------
-- Indexes structure for table d_customer
-- ----------------------------
CREATE INDEX "d_customer_30_04_2018_v1_ix_vat" ON "d_znbs"."d_customer" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "d_customer_30_04_2018_v1_ix_vat_glob" ON "d_znbs"."d_customer" USING btree (
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);
CREATE INDEX "d_customer_ix_vat" ON "d_znbs"."d_customer" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "d_customer_ix_vat_glob" ON "d_znbs"."d_customer" USING btree (
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_customer
-- ----------------------------
ALTER TABLE "d_znbs"."d_customer" ADD CONSTRAINT "d_customer_pk" PRIMARY KEY ("context_id", "customer_id");

-- ----------------------------
-- Indexes structure for table d_customer_copy1
-- ----------------------------
CREATE INDEX "d_customer_30_04_2018_v1_ix_vat_copy1" ON "d_znbs"."d_customer_copy1" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "d_customer_30_04_2018_v1_ix_vat_glob_copy1" ON "d_znbs"."d_customer_copy1" USING btree (
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);
CREATE INDEX "d_customer_ix_vat_copy1" ON "d_znbs"."d_customer_copy1" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "d_customer_ix_vat_glob_copy1" ON "d_znbs"."d_customer_copy1" USING btree (
  "vat_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_customer_copy1
-- ----------------------------
ALTER TABLE "d_znbs"."d_customer_copy1" ADD CONSTRAINT "d_customer_copy1_pkey" PRIMARY KEY ("context_id", "customer_id");

-- ----------------------------
-- Primary Key structure for table d_customer_results
-- ----------------------------
ALTER TABLE "d_znbs"."d_customer_results" ADD CONSTRAINT "d_scenario_results_pk" PRIMARY KEY ("scenario_id", "customer_id");

-- ----------------------------
-- Primary Key structure for table d_ext_assessment
-- ----------------------------
ALTER TABLE "d_znbs"."d_ext_assessment" ADD CONSTRAINT "d_ext_assessment_pk" PRIMARY KEY ("context_id", "customer_id", "assessment_date");

-- ----------------------------
-- Primary Key structure for table d_group
-- ----------------------------
ALTER TABLE "d_znbs"."d_group" ADD CONSTRAINT "d_group_pk" PRIMARY KEY ("context_id", "group_id");

-- ----------------------------
-- Primary Key structure for table d_model
-- ----------------------------
ALTER TABLE "d_znbs"."d_model" ADD CONSTRAINT "d_model_pk" PRIMARY KEY ("context_id", "model_id", "effective_date");

-- ----------------------------
-- Primary Key structure for table d_optimizer_params
-- ----------------------------
ALTER TABLE "d_znbs"."d_optimizer_params" ADD CONSTRAINT "d_optimizer_params_pk" PRIMARY KEY ("context_id", "ref_date");

-- ----------------------------
-- Primary Key structure for table d_portfolio
-- ----------------------------
ALTER TABLE "d_znbs"."d_portfolio" ADD CONSTRAINT "d_portfolio_pk" PRIMARY KEY ("context_id", "portfolio_id");

-- ----------------------------
-- Primary Key structure for table d_prospect_results
-- ----------------------------
ALTER TABLE "d_znbs"."d_prospect_results" ADD CONSTRAINT "d_prospect_results_pk" PRIMARY KEY ("scenario_id", "prospect_id");

-- ----------------------------
-- Indexes structure for table d_scenario
-- ----------------------------
CREATE INDEX "d_scenario_ix_date" ON "d_znbs"."d_scenario" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "snapshot_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "current_owner" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "d_scenario_ix_login" ON "d_znbs"."d_scenario" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "current_owner" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "snapshot_date" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_scenario
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario" ADD CONSTRAINT "d_scenario_pk" PRIMARY KEY ("scenario_id");

-- ----------------------------
-- Indexes structure for table d_scenario_customer
-- ----------------------------
CREATE INDEX "d_scenario_customer_ix" ON "d_znbs"."d_scenario_customer" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_scenario_customer
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_customer" ADD CONSTRAINT "d_scenario_customer_pk" PRIMARY KEY ("scenario_id", "customer_id");

-- ----------------------------
-- Primary Key structure for table d_scenario_default_params
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_default_params" ADD CONSTRAINT "d_scenario_default_params_pk" PRIMARY KEY ("context_id", "ref_date");

-- ----------------------------
-- Indexes structure for table d_scenario_portfolio
-- ----------------------------
CREATE INDEX "d_scenario_context_ix" ON "d_znbs"."d_scenario_portfolio" USING btree (
  "portfolio_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_scenario_portfolio
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_portfolio" ADD CONSTRAINT "d_scenario_context_pk" PRIMARY KEY ("scenario_id", "portfolio_id");

-- ----------------------------
-- Primary Key structure for table d_scenario_prospect
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_prospect" ADD CONSTRAINT "d_prospect_pk" PRIMARY KEY ("scenario_id", "prospect_id");

-- ----------------------------
-- Indexes structure for table d_snapshot
-- ----------------------------
CREATE INDEX "d_snapshot_ix_customer" ON "d_znbs"."d_snapshot" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "snapshot_date" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_snapshot
-- ----------------------------
ALTER TABLE "d_znbs"."d_snapshot" ADD CONSTRAINT "d_snapshot_pk" PRIMARY KEY ("context_id", "snapshot_date", "customer_id");

-- ----------------------------
-- Indexes structure for table d_snapshot_copy1
-- ----------------------------
CREATE INDEX "d_snapshot_ix_customer_copy1" ON "d_znbs"."d_snapshot_copy1" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "snapshot_date" "pg_catalog"."date_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table d_snapshot_copy1
-- ----------------------------
ALTER TABLE "d_znbs"."d_snapshot_copy1" ADD CONSTRAINT "d_snapshot_copy1_pkey" PRIMARY KEY ("context_id", "snapshot_date", "customer_id");

-- ----------------------------
-- Primary Key structure for table d_user_default_params
-- ----------------------------
ALTER TABLE "d_znbs"."d_user_default_params" ADD CONSTRAINT "d_default_params_pk" PRIMARY KEY ("context_id");

-- ----------------------------
-- Primary Key structure for table m_activity
-- ----------------------------
ALTER TABLE "d_znbs"."m_activity" ADD CONSTRAINT "m_activity_pk" PRIMARY KEY ("context_id", "activity_id");

-- ----------------------------
-- Primary Key structure for table m_area
-- ----------------------------
ALTER TABLE "d_znbs"."m_area" ADD CONSTRAINT "m_area_pk" PRIMARY KEY ("context_id", "area_id");

-- ----------------------------
-- Indexes structure for table m_assessment_grade
-- ----------------------------
CREATE INDEX "m_assessment_grades_ix" ON "d_znbs"."m_assessment_grade" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "scale_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "grade_descr" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table m_assessment_grade
-- ----------------------------
ALTER TABLE "d_znbs"."m_assessment_grade" ADD CONSTRAINT "m_assessment_grades_pk" PRIMARY KEY ("context_id", "scale_id", "grade_id");

-- ----------------------------
-- Primary Key structure for table m_bucket
-- ----------------------------
ALTER TABLE "d_znbs"."m_bucket" ADD CONSTRAINT "m_bucket_pk" PRIMARY KEY ("context_id", "bucket_id");

-- ----------------------------
-- Primary Key structure for table m_criterion
-- ----------------------------
ALTER TABLE "d_znbs"."m_criterion" ADD CONSTRAINT "m_criterion_pk" PRIMARY KEY ("context_id", "model_type", "criterion_id");

-- ----------------------------
-- Primary Key structure for table m_customer_status
-- ----------------------------
ALTER TABLE "d_znbs"."m_customer_status" ADD CONSTRAINT "m_customer_status_pk" PRIMARY KEY ("context_id", "customer_status_id");

-- ----------------------------
-- Primary Key structure for table m_entity_info
-- ----------------------------
ALTER TABLE "d_znbs"."m_entity_info" ADD CONSTRAINT "m_entity_info_pk" PRIMARY KEY ("context_id", "entity_info_id");

-- ----------------------------
-- Primary Key structure for table m_exposure
-- ----------------------------
ALTER TABLE "d_znbs"."m_exposure" ADD CONSTRAINT "m_exposure_pk" PRIMARY KEY ("context_id", "exposure_id");

-- ----------------------------
-- Primary Key structure for table m_industry
-- ----------------------------
ALTER TABLE "d_znbs"."m_industry" ADD CONSTRAINT "m_industry_pk" PRIMARY KEY ("context_id", "industry_id");

-- ----------------------------
-- Primary Key structure for table m_mitigant
-- ----------------------------
ALTER TABLE "d_znbs"."m_mitigant" ADD CONSTRAINT "m_mitigant_pk" PRIMARY KEY ("context_id", "mitigant_type_id");

-- ----------------------------
-- Indexes structure for table m_score
-- ----------------------------
CREATE INDEX "m_score_ix" ON "d_znbs"."m_score" USING btree (
  "context_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "score" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table m_score
-- ----------------------------
ALTER TABLE "d_znbs"."m_score" ADD CONSTRAINT "m_score_pk" PRIMARY KEY ("context_id", "score_id");

-- ----------------------------
-- Primary Key structure for table p_scenario_stats
-- ----------------------------
ALTER TABLE "d_znbs"."p_scenario_stats" ADD CONSTRAINT "p_scenario_stats_pk" PRIMARY KEY ("scenario_id", "portfolio_id", "score");

-- ----------------------------
-- Primary Key structure for table p_snapshot_stats
-- ----------------------------
ALTER TABLE "d_znbs"."p_snapshot_stats" ADD CONSTRAINT "p_snapshot_stats_pk" PRIMARY KEY ("context_id", "snapshot_date", "portfolio_id", "score");

-- ----------------------------
-- Primary Key structure for table p_snapshot_stats_copy1
-- ----------------------------
ALTER TABLE "d_znbs"."p_snapshot_stats_copy1" ADD CONSTRAINT "p_snapshot_stats_copy1_pkey" PRIMARY KEY ("context_id", "snapshot_date", "portfolio_id", "score");

-- ----------------------------
-- Foreign Keys structure for table d_prospect_results
-- ----------------------------
ALTER TABLE "d_znbs"."d_prospect_results" ADD CONSTRAINT "p_prospect_results_fk" FOREIGN KEY ("scenario_id") REFERENCES "d_znbs"."d_scenario" ("scenario_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table d_scenario_customer
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_customer" ADD CONSTRAINT "d_scenario_customer_fk" FOREIGN KEY ("scenario_id") REFERENCES "d_znbs"."d_scenario" ("scenario_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table d_scenario_portfolio
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_portfolio" ADD CONSTRAINT "d_scenario_portfolio_fk" FOREIGN KEY ("scenario_id") REFERENCES "d_znbs"."d_scenario" ("scenario_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table d_scenario_prospect
-- ----------------------------
ALTER TABLE "d_znbs"."d_scenario_prospect" ADD CONSTRAINT "d_scenario_prospect_fk" FOREIGN KEY ("scenario_id") REFERENCES "d_znbs"."d_scenario" ("scenario_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table p_scenario_stats
-- ----------------------------
ALTER TABLE "d_znbs"."p_scenario_stats" ADD CONSTRAINT "p_scenario_stats_fk" FOREIGN KEY ("scenario_id") REFERENCES "d_znbs"."d_scenario" ("scenario_id") ON DELETE CASCADE ON UPDATE CASCADE;




insert overwrite table pickup_accuracy_l2_fact

select
T1.vendor_tracking_id as vendor_tracking_id, 
T1.rvp_current_hub_id_key as rvp_current_hub_id_key, 
T1.rvp_pickup_completed_date_key as rvp_pickup_completed_date_key, 
T1.rvp_pickup_completed_time_key as rvp_pickup_completed_time_key, 
T1.rvp_dh_received_date_key as rvp_dh_received_date_key, 
T1.rvp_dh_received_time_key as rvp_dh_received_time_key, 
T1.rvp_schedule_date_key as rvp_schedule_date_key, 
T1.rvp_schedule_time_key as rvp_schedule_time_key, 
T1.rvp_first_pickup_attempt_date_key as rvp_first_pickup_attempt_date_key, 
T1.rvp_first_pickup_attempt_time_key as rvp_first_pickup_attempt_time_key, 
T1.first_customer_reattempt_date_key as first_customer_reattempt_date_key, 
T1.first_customer_reattempt_time_key as first_customer_reattempt_time_key, 
T1.first_ekl_reattempt_date_key as first_ekl_reattempt_date_key, 
T1.first_ekl_reattempt_time_key as first_ekl_reattempt_time_key, 
T1.shipment_current_status_date_key as shipment_current_status_date_key, 
T1.shipment_current_status_time_key as shipment_current_status_time_key, 
T1.shipment_first_rvp_pickup_date_key as shipment_first_rvp_pickup_date_key, 
T1.shipment_first_rvp_pickup_time_key as shipment_first_rvp_pickup_time_key, 
T1.shipment_last_rvp_pickup_date_key as shipment_last_rvp_pickup_date_key, 
T1.shipment_last_rvp_pickup_time_key as shipment_last_rvp_pickup_time_key, 
T1.ekl_shipment_type as ekl_shipment_type, 
T1.fkl_current_status as fkl_current_status, 
T1.fkl_pending_status as fkl_pending_status, 
T1.no_of_attempts as no_of_attempts, 
T1.no_of_attempts_customer_dependency as no_of_attempts_customer_dependency, 
T1.no_of_attempts_ekl_dependency as no_of_attempts_ekl_dependency, 
T1.shipment_current_status as shipment_current_status, 
T1.reverse_shipment_type as reverse_shipment_type, 
T1.ekl_fin_zone as ekl_fin_zone, 
T1.ekart_lzn_flag as ekart_lzn_flag, 
T1.rvp_schedule_dateno as rvp_schedule_dateno, 
T1.rvp_pickup_completed_dateno as rvp_pickup_completed_dateno, 
T1.rvp_first_pickup_attempt_dateno as rvp_first_pickup_attempt_dateno, 
T1.today_dateno as today_dateno, 
T1.holiday_exception as holiday_exception, 
T1.pickup_difference as pickup_difference, 
T1.rvp_pending_flag as rvp_pending_flag, 
T1.rvp_pickup_pending_days as rvp_pickup_pending_days, 
T1.rvp_pickup_complete_days as rvp_pickup_complete_days, 
T1.create_to_attempt_days as create_to_attempt_days, 
T1.first_attempt_owner as first_attempt_owner, 
T1.pickup_breach_bucket as pickup_breach_bucket, 
T1.ekl_breach as ekl_breach, 
T1.p1d_breach_bucket as p1d_breach_bucket, 
T1.no_of_attempts_customer_dependency_old as no_of_attempts_customer_dependency_old, 
T1.no_of_attempts_ekl_dependency_old as no_of_attempts_ekl_dependency_old, 
T1.source_pincode_key as source_pincode_key, 
T1.reverse_pickup_hub_id_key as reverse_pickup_hub_id_key,
T1.seller_type as seller_type,
T1.source_pincode as source_pincode,
T1.source_city as source_city,
T1.source_state as source_state,
T1.source_zone as source_zone,
T1.initial_pickup_hub_name as initial_pickup_hub_name
from bigfoot_external_neo.scp_ekl__pickup_accuracy_l2_hive_fact as T1 


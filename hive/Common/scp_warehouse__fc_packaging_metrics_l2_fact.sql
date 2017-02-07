INSERT OVERWRITE TABLE fc_packaging_metrics_l2_fact
select
pmhf.warehouse_company as warehouse_company , 
pmhf.shipment_item_id as shipment_item_id , 
pmhf.shipment_item_product_id as shipment_item_product_id , 
pmhf.shipment_item_product_key as shipment_item_product_key , 
pmhf.shipment_item_quantity as shipment_item_quantity , 
pmhf.shipment_id as shipment_id , 
pmhf.shipment_destination_type as shipment_destination_type , 
pmhf.shipment_display_id as shipment_display_id , 
pmhf.shipment_warehouse_id as shipment_warehouse_id , 
pmhf.shipment_status as shipment_status , 
pmhf.shipment_updated_timestamp as shipment_updated_timestamp , 
pmhf.shipment_updated_date_key as shipment_updated_date_key , 
pmhf.shipment_updated_time_key as shipment_updated_time_key , 
pmhf.shipment_dispatched_timestamp as shipment_dispatched_timestamp , 
pmhf.shipment_dispatched_date_key as shipment_dispatched_date_key , 
pmhf.shipment_dispatched_time_key as shipment_dispatched_time_key , 
pmhf.shipment_dispatched_by as shipment_dispatched_by , 
pmhf.is_non_wsr_fbf_shipment as is_non_wsr_fbf_shipment , 
pmhf.shipment_warehouse_dim_key as shipment_warehouse_dim_key , 
pmhf.shipment_entity_type as shipment_entity_type , 
pmhf.box_ideal_packing_box_id as box_ideal_packing_box_id , 
pmhf.box_bag_serial_number as box_bag_serial_number , 
pmhf.shipment_packed_timestamp as shipment_packed_timestamp , 
pmhf.shipment_packed_date_key as shipment_packed_date_key , 
pmhf.shipment_packed_time_key as shipment_packed_time_key , 
pmhf.shipment_packed_by as shipment_packed_by , 
pmhf.packing_box_used_internal_name as packing_box_used_internal_name , 
pmhf.packing_box_suggested_internal_name as packing_box_suggested_internal_name , 
pmhf.shipment_tracking_id as shipment_tracking_id , 
pmhf.shipment_packing_box_used as shipment_packing_box_used , 
pmhf.shipment_volume as shipment_volume , 
pmhf.shipment_packing_box_used_bucket as shipment_packing_box_used_bucket , 
pmhf.distinct_fsn_count as distinct_fsn_count , 
pmhf.distinct_cms_vertical_count as distinct_cms_vertical_count , 
pmhf.distinct_wid_count as distinct_wid_count , 
pmhf.shipment_is_fragile as shipment_is_fragile , 
pmhf.shipment_quantity as shipment_quantity , 
pmhf.shipment_packing_box_suggested_name as shipment_packing_box_suggested_name , 
pmhf.shipment_packing_box_suggested_volume as shipment_packing_box_suggested_volume , 
pmhf.shipment_packing_box_suggested_bucket as shipment_packing_box_suggested_bucket , 
pmhf.shipment_box_used_packing_box_id as shipment_box_used_packing_box_id , 
pmhf.shipment_box_suggested_packing_box_id as shipment_box_suggested_packing_box_id , 
pmhf.is_packing_box_suggested as is_packing_box_suggested , 
pmhf.is_packing_box_used as is_packing_box_used , 
pmhf.is_suggested_packing_box_valid as is_suggested_packing_box_valid , 
pmhf.is_used_packing_box_valid as is_used_packing_box_valid , 
pmhf.used_packing_box_volume_order as used_packing_box_volume_order , 
pmhf.suggested_packing_box_volume_order as suggested_packing_box_volume_order , 
pmhf.used_packing_bucket_volume_order as used_packing_bucket_volume_order , 
pmhf.suggested_packing_bucket_volume_order as suggested_packing_bucket_volume_order , 
pmhf.is_box_suggested_new as is_box_suggested_new , 
pmhf.is_box_used_new as is_box_used_new , 
pmhf.is_exact_adhered as is_exact_adhered , 
pmhf.is_mobile_tablet_category as is_mobile_tablet_category , 
pmhf.is_mobile_adherence as is_mobile_adherence , 
pmhf.is_packed_in_lower_volume as is_packed_in_lower_volume , 
pmhf.is_bucket_adhered as is_bucket_adhered,
pmhf.box_suggested_outer_packing_box_id as box_suggested_outer_packing_box_id , 
pmhf.packing_box_suggested_outer_name as packing_box_suggested_outer_name , 
pmhf.packing_box_suggested_outer_bucket as packing_box_suggested_outer_bucket , 
pmhf.is_outer_packing_box_suggested as is_outer_packing_box_suggested , 
pmhf.is_outer_suggested_packing_box_valid as is_outer_suggested_packing_box_valid , 
pmhf.suggested_outer_packing_box_volume_order as suggested_outer_packing_box_volume_order , 
pmhf.suggested_outer_packing_bucket_volume_order as suggested_outer_packing_bucket_volume_order , 
pmhf.is_box_outer_suggested_new as is_box_outer_suggested_new , 
pmhf.box_outer_used_packing_box_id as box_outer_used_packing_box_id , 
pmhf.packing_box_used_outer_name as packing_box_used_outer_name , 
pmhf.packing_box_used_outer_bucket as packing_box_used_outer_bucket , 
pmhf.is_outer_packing_box_used as is_outer_packing_box_used , 
pmhf.is_outer_used_packing_box_valid as is_outer_used_packing_box_valid , 
pmhf.used_outer_packing_box_volume_order as used_outer_packing_box_volume_order , 
pmhf.used_outer_packing_bucket_volume_order as used_outer_packing_bucket_volume_order , 
pmhf.is_box_outer_used_new as is_box_outer_used_new , 
pmhf.is_exact_adhered_outer as is_exact_adhered_outer , 
pmhf.is_mobile_adherence_outer as is_mobile_adherence_outer , 
pmhf.is_packed_in_lower_volume_outer as is_packed_in_lower_volume_outer , 
pmhf.is_bucket_adhered_outer as is_bucket_adhered_outer ,
pmhf.box_usage as box_usage , 
pmhf.sb_usage as sb_usage , 
pmhf.label_usage as label_usage , 
pmhf.tape_usage as tape_usage , 
pmhf.invoice_pouch_usage as invoice_pouch_usage , 
pmhf.2pl_usage as 2pl_usage , 
pmhf.gift_paper_usage as gift_paper_usage , 
pmhf.extra_tape_usage as extra_tape_usage , 
pmhf.bubble_usage as bubble_usage , 
pmhf.void_filler_usage as void_filler_usage , 
pmhf.shrink_wrap_usage as shrink_wrap_usage , 
pmhf.box_usage_value as box_usage_value , 
pmhf.sb_usage_value as sb_usage_value , 
pmhf.label_usage_value as label_usage_value , 
pmhf.tape_usage_value as tape_usage_value , 
pmhf.invoice_pouch_usage_value as invoice_pouch_usage_value , 
pmhf.2pl_usage_value as 2pl_usage_value , 
pmhf.gift_paper_usage_value as gift_paper_usage_value , 
pmhf.extra_tape_usage_value as extra_tape_usage_value , 
pmhf.bubble_usage_value as bubble_usage_value , 
pmhf.void_filler_usage_value as void_filler_usage_value , 
pmhf.shrink_wrap_usage_value as shrink_wrap_usage_value , 
pmhf.total_packaging_usage_value as total_packaging_usage_value,
pmhf.adherance as adherance,
pmhf.shipment_outer_packing_box_suggested_volume as shipment_outer_packing_box_suggested_volume,
pmhf.shipment_product_volume as shipment_product_volume
from 
bigfoot_external_neo.scp_warehouse__fc_packaging_metrics_l2_hive_fact pmhf

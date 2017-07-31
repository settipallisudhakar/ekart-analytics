INSERT OVERWRITE TABLE fc_movement_request_unit_l0_hive_fact
select
final_table.company,
final_table.mr_assigned_to,
final_table.mr_created_at,
final_table.mr_created_date_key,
final_table.mr_created_time_key,
final_table.mr_created_by,
final_table.mr_destination_type,
final_table.mr_movement_request_id,
final_table.mr_source_type,
final_table.mr_status,
final_table.mr_total_quantity,
final_table.mr_type,
final_table.mr_updated_at,
final_table.mr_updated_date_key,
final_table.mr_updated_time_key,
final_table.mr_warehouse_id,
final_table.mri_destination_location,
final_table.mri_device_id,
final_table.mri_equipment_info,
final_table.mri_movement_request_item_id,
final_table.mri_product_id_key,
final_table.mri_quantity,
final_table.mri_source_location,
final_table.mri_status,
final_table.ti_entity_id,
final_table.ti_entity_type,
final_table.ti_status,
final_table.ti_task_id,
final_table.ti_updated_at,
final_table.ti_updated_date_key,
final_table.ti_updated_time_key,
final_table.ti_updated_by,
final_table.task_type,
final_table.task_updated_at,
final_table.task_updated_date_key,
final_table.task_updated_time_key,
final_table.task_updated_by,
final_table.mr_warehouse_dim_key,
final_table.mri_source_location_dim_key,
final_table.mri_destination_location_dim_key,
final_table.ti_quantity,
final_table.ti_inventory_item_id,
final_table.ti_reservation_id as ti_reservation_id,
final_table.ti_product_id_key as ti_product_id_key,
final_table.ti_grn_id,
final_table.ti_grn_document_id,
final_table.ti_grn_created_time,
final_table.ti_grn_created_date_key,
final_table.ti_grn_created_time_key
from
(
  select
'fki' as company,
mr.`data`.assigned_to as mr_assigned_to,
from_unixtime(unix_timestamp(mr.`data`.created_at)) as mr_created_at,
lookup_date(mr.`data`.created_at) as mr_created_date_key,
lookup_time(mr.`data`.created_at) as mr_created_time_key,
mr.`data`.created_by as mr_created_by,
mr.`data`.destination_type as mr_destination_type,
mr.`data`.id as mr_movement_request_id,
mr.`data`.source_type as mr_source_type,
mr.`data`.status as mr_status,
mr.`data`.total_quantity as mr_total_quantity,
mr.`data`.type as mr_type,
from_unixtime(unix_timestamp(mr.`data`.updated_at)) as mr_updated_at,
lookup_date(mr.`data`.updated_at) as mr_updated_date_key,
lookup_time(mr.`data`.updated_at) as mr_updated_time_key,
mr.`data`.warehouse_id as mr_warehouse_id,
'' as mri_destination_location,
'' as mri_device_id,
'' as mri_equipment_info,
'' as mri_movement_request_item_id,
'' as mri_product_id_key,
'' as mri_quantity,
'' as mri_source_location,
'' as mri_status,
ti.`data`.entity_id as ti_entity_id,
ti.`data`.entity_type as ti_entity_type,
ti.`data`.status as ti_status,
ti.`data`.task_id as ti_task_id,
from_unixtime(unix_timestamp(ti.`data`.updated_at)) as ti_updated_at,
lookup_date(ti.`data`.updated_at) as ti_updated_date_key,
lookup_time(ti.`data`.updated_at) as ti_updated_time_key,
ti.`data`.updated_by as ti_updated_by,
'' as task_type,
'' as task_updated_at,
'' as task_updated_date_key,
'' as task_updated_time_key,
'' as task_updated_by,
lookupkey('warehouse_id',mr.`data`.warehouse_id) as mr_warehouse_dim_key,
'' as mri_source_location_dim_key,
'' as mri_destination_location_dim_key,
1 as ti_quantity,
ti.`data`.inventory_item_id as ti_inventory_item_id,
ti.`data`.reservation_id as ti_reservation_id,
ii.product_id_key as ti_product_id_key,
grn.grn_id as ti_grn_id,
grn.grn_document_id as ti_grn_document_id,
grn.grn_created_at as ti_grn_created_time,
grn.grn_created_date_key as ti_grn_created_date_key,
grn.grn_created_time_key as ti_grn_created_time_key
from bigfoot_snapshot.dart_fki_scp_warehouse_movementrequest_2_view mr left outer join
bigfoot_snapshot.dart_fki_scp_warehouse_taskitem_2_view ti on ti.`data`.movement_request_id = mr.`data`.id 
left join bigfoot_external_neo.scp_warehouse__fc_inventory_item_l0_hive_fact ii on ii.inventory_item_id = ti.`data`.inventory_item_id and ii.warehouse_company = 'fki'
left join bigfoot_external_neo.scp_warehouse__fc_inbound_receiving_l0_hive_fact grn on grn.grn_id = ii.inventory_item_grn_id

union all

select
'wsr' as company,
mr.`data`.assigned_to as mr_assigned_to,
from_unixtime(unix_timestamp(mr.`data`.created_at)) as mr_created_at,
lookup_date(mr.`data`.created_at) as mr_created_date_key,
lookup_time(mr.`data`.created_at) as mr_created_time_key,
mr.`data`.created_by as mr_created_by,
mr.`data`.destination_type as mr_destination_type,
mr.`data`.id as mr_movement_request_id,
mr.`data`.source_type as mr_source_type,
mr.`data`.status as mr_status,
mr.`data`.total_quantity as mr_total_quantity,
mr.`data`.type as mr_type,
from_unixtime(unix_timestamp(mr.`data`.updated_at)) as mr_updated_at,
lookup_date(mr.`data`.updated_at) as mr_updated_date_key,
lookup_time(mr.`data`.updated_at) as mr_updated_time_key,
mr.`data`.warehouse_id as mr_warehouse_id,
'' as mri_destination_location,
'' as mri_device_id,
'' as mri_equipment_info,
'' as mri_movement_request_item_id,
'' as mri_product_id_key,
'' as mri_quantity,
'' as mri_source_location,
'' as mri_status,
ti.`data`.entity_id as ti_entity_id,
ti.`data`.entity_type as ti_entity_type,
ti.`data`.status as ti_status,
ti.`data`.task_id as ti_task_id,
from_unixtime(unix_timestamp(ti.`data`.updated_at)) as ti_updated_at,
lookup_date(ti.`data`.updated_at) as ti_updated_date_key,
lookup_time(ti.`data`.updated_at) as ti_updated_time_key,
ti.`data`.updated_by as ti_updated_by,
'' as task_type,
'' as task_updated_at,
'' as task_updated_date_key,
'' as task_updated_time_key,
'' as task_updated_by,
lookupkey('warehouse_id',mr.`data`.warehouse_id) as mr_warehouse_dim_key,
'' as mri_source_location_dim_key,
'' as mri_destination_location_dim_key,
1 as ti_quantity,
ti.`data`.inventory_item_id as ti_inventory_item_id,
ti.`data`.reservation_id as ti_reservation_id,
ii.product_id_key as ti_product_id_key,
grn.grn_id as ti_grn_id,
grn.grn_document_id as ti_grn_document_id,
grn.grn_created_at as ti_grn_created_time,
grn.grn_created_date_key as ti_grn_created_date_key,
grn.grn_created_time_key as ti_grn_created_time_key
from bigfoot_snapshot.dart_wsr_scp_warehouse_movementrequest_3_view mr 
left join bigfoot_snapshot.dart_wsr_scp_warehouse_taskitem_3_view ti on ti.`data`.movement_request_id = mr.`data`.id
left join bigfoot_external_neo.scp_warehouse__fc_inventory_item_l0_hive_fact ii on ii.inventory_item_id = ti.`data`.inventory_item_id and ii.warehouse_company = 'wsr'
left join bigfoot_external_neo.scp_warehouse__fc_inbound_receiving_l0_hive_fact grn on grn.grn_id = ii.inventory_item_grn_id
) final_table
;

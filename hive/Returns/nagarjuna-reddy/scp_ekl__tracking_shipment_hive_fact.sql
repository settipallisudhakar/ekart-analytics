INSERT OVERWRITE TABLE tracking_shipment_hive_fact
SELECT
a.consignment_id as consignment_id,
a.consignment_connection_id,
a.consignment_type,
a.consignment_mode,
a.connection_type,
a.connection_transit_type,
a.connection_code,
a.connection_frequency_type,
a.consignment_status,
a.consignment_co_loader,
a.consignment_breach_flag,
a.consignment_movement_flag,
a.consignment_source_hub_type,
a.consignment_destination_hub_type,
lookupkey('facility_id',a.consignment_source_hub_id) AS consignment_source_hub_id_key,
lookupkey('facility_id',a.consignment_destination_hub_id) AS consignment_destination_hub_id_key,
lookup_date(a.connection_cut_off_datetime) AS connection_cut_off_date_key,
lookup_time(a.connection_cut_off_datetime) AS connection_cut_off_time_key,
lookup_date(a.consignment_create_datetime) AS consignment_create_date_key,
lookup_time(a.consignment_create_datetime) AS consignment_create_time_key,
lookup_date(a.consignment_status_date_time) AS consignment_status_date_key,
lookup_time(a.consignment_status_date_time) AS consignment_status_time_key,
lookup_date(a.consignment_eta_datetime) AS consignment_eta_date_key,
lookup_time(a.consignment_eta_datetime) AS consignment_eta_time_key,
lookup_date(a.consignment_received_datetime) AS consignment_received_date_key,
lookup_time(a.consignment_received_datetime) AS consignment_received_time_key,
a.bag_id as bag_id,
g.bag_tracking_id as bag_tracking_id,
g.bag_seal_id as bag_seal_id,
lookupkey('facility_id',g.bag_source_hub_id) as bag_source_hub_id_key,
lookupkey('facility_id',g.bag_assigned_hub_id) as bag_assigned_hub_id_key,
lookup_date(cast(d.bag_inscan as TIMESTAMP)) as bag_inscan_date_key,
lookup_time(cast(d.bag_inscan as TIMESTAMP)) as bag_inscan_time_key,
a.vendor_tracking_id as vendor_tracking_id,
lookup_date(cast(e.shipment_inscan as TIMESTAMP)) as shipment_inscan_date_key,
lookup_time(cast(e.shipment_inscan as TIMESTAMP)) as shipment_inscan_time_key,
f.seller_id as seller_id,
f.seller_type as seller_type,
f.shipment_dg_flag as shipment_dg_flag,
f.shipment_fa_flag as shipment_fa_flag,
f.source_address_pincode as source_address_pincode,
f.destination_address_pincode as destination_address_pincode,
lookupkey('facility_id',f.fsd_assigned_hub_id) as fsd_assigned_hub_id_key,
lookupkey('facility_id',f.shipment_origin_mh_facility_id) as shipment_origin_mh_facility_id_key,
lookupkey('facility_id',f.shipment_destination_mh_facility_id) as shipment_destination_mh_facility_id_key,
f.logistics_promise_datetime as logistics_promise_datetime,
f.customer_promise_datetime as customer_promise_datetime,
f.ekl_fin_zone as ekl_fin_zone,
f.payment_type as payment_type,
f.payment_mode as payment_mode,
f.amount_collected as amount_collected,
f.shipment_priority_flag as shipment_priority_flag,
f.service_tier as shipment_size_flag,
If(f.ekl_shipment_type like '%rto%' and f.rto_create_datetime > a.consignment_create_datetime,'forward',f.ekl_shipment_type) as ekl_shipment_type,
f.shipment_current_status as shipment_current_status,
f.reverse_shipment_type as reverse_shipment_type,
f.shipment_weight as shipment_weight,
f.sender_weight as sender_weight,
f.system_weight as system_weight,
f.volumetric_weight as volumetric_weight,
f.billable_weight as billable_weight,
f.shipment_value as shipment_value,
f.cod_amount_to_collect as cod_amount_to_collect,
f.shipment_charge as shipment_charge,
f.cs_notes as cs_notes,
H.hub_notes as hub_notes,
lookup_date(f.shipment_delivered_at_datetime) as shipment_delivered_at_date_key,
lookup_time(f.shipment_delivered_at_datetime) as shipment_delivered_at_time_key,
If(a.consignment_source_hub_id = shipment_origin_mh_facility_id and a.consignment_source_hub_id = bag_source_hub_id,1,0) as sort_flag,
If(a.consignment_source_hub_id <> shipment_origin_mh_facility_id and a.consignment_source_hub_id = bag_source_hub_id, 1, 0) as resort_flag,
cast(e.shipment_inscan as TIMESTAMP) as shipment_inscan_datetime,
cast(d.bag_inscan as TIMESTAMP) as bag_inscan_datetime,
a.consignment_create_datetime as consignment_create_datetime,
a.consignment_received_datetime as consignment_received_datetime,
a.consignment_source_hub_id as consignment_source_hub_id,
a.consignment_destination_hub_id as consignment_destination_hub_id,
g.bag_source_hub_id as bag_source_hub_id,
g.bag_assigned_hub_id as bag_assigned_hub_id,
f.fsd_assigned_hub_id as fsd_assigned_hub_id,
f.shipment_origin_mh_facility_id as shipment_origin_mh_facility_id,
f.shipment_destination_mh_facility_id as shipment_destination_mh_facility_id,
g.bag_category as bag_category,
g.bag_number_of_offloads as bag_number_of_offloads,
g.bag_first_offload_reason bag_first_offload_reason,
fsn_table.fsn_id as fsn_id,
lookupkey('product_id',fsn_table.fsn_id) as primary_product_key,
f.merchant_reference_id as merchant_reference_id,
f.shipment_created_at_datetime as shipment_created_at_datetime,
lookup_date(f.shipment_created_at_datetime) as shipment_created_at_date_key,
lookup_time(f.shipment_created_at_datetime) as shipment_created_at_time_key,
If(a.consignment_co_loader in ('CSDTransport','TH_ABBAS_TRANSPORT','Super_India_Logistics','Harsha Transport','Truck_Fast','SVC Roadlines','Rishabh Cargo','Dhir Roadways','SajalMajumder','Trans_Cargo_India','Mahi Transport','STCS_Logistics','Ghosh_Enterpirses','CENTURY_CARGO_CARRIER','Kailash'),1,0) as ftl_flag,
a.consignment_system_weight as consignment_system_weight,
g.bag_current_hub_id as bag_current_hub_id,
g.bag_current_status as bag_current_status,
lookup_date(cast(f.rto_create_datetime as TIMESTAMP)) as rto_create_date_key,
lookup_time(cast(f.rto_create_datetime as TIMESTAMP)) as rto_create_time_key,
f.ekart_lzn_flag as ekart_lzn_flag,
a.consignment_awb_number,
a.connection_vehicle_no,
a.consignment_eta_datetime,
lookupkey('facility_id',g.bag_current_hub_id) AS bag_current_hub_id_key,
pr.wdecision_length,
pr.wdecision_breadth,
pr.wdecision_height,
null as profiled_volume_in_gms,
null as profiled_vol_weight_bucket,
e.length,
e.breadth,
e.height,
pr.wdecision_weight as physical,
e.contour_volume
from 
(select x.consignment_id as consignment_id,
b.bag_id as bag_id,
c.shipment_id as vendor_tracking_id,
x.consignment_system_weight,
x.consignment_connection_id,
x.consignment_type,
x.consignment_mode,
x.connection_type,
x.connection_transit_type,
x.connection_code,
x.connection_frequency_type,
x.consignment_status,
x.consignment_co_loader,
x.consignment_breach_flag,
x.consignment_movement_flag,
x.consignment_source_hub_type,
x.consignment_destination_hub_type,
x.consignment_source_hub_id as consignment_source_hub_id,
x.consignment_destination_hub_id as consignment_destination_hub_id,
lookupkey('facility_id',x.consignment_source_hub_id) AS consignment_source_hub_id_key,
lookupkey('facility_id',x.consignment_destination_hub_id) AS consignment_destination_hub_id_key,
x.connection_cut_off_datetime AS connection_cut_off_datetime,
x.consignment_create_datetime AS consignment_create_datetime,
x.consignment_status_date_time AS consignment_status_date_time,
x.consignment_eta_datetime AS consignment_eta_datetime,
x.consignment_received_datetime AS consignment_received_datetime,
x.consignment_awb_number,
x.connection_vehicle_no
from bigfoot_external_neo.scp_ekl__consignment_l1_90_fact x
left join bigfoot_external_neo.scp_ekl__bag_consignment_map_90_fact b on b.consignment_id = x.consignment_id
left join bigfoot_external_neo.scp_ekl__shipment_closedbag_map_l1_90_fact c on CAST(SPLIT(c.bag, "-")[1] AS INT)  = b.bag_id
where x.consignment_type = 'BAG'
union all
select i.consignment_id,
null as bag_id, 
h.shipment_id as vendor_tracking_id,
i.consignment_system_weight as consignment_system_weight,
i.consignment_connection_id,
i.consignment_type,
i.consignment_mode,
i.connection_type,
i.connection_transit_type,
i.connection_code,
i.connection_frequency_type,
i.consignment_status,
i.consignment_co_loader,
i.consignment_breach_flag,
i.consignment_movement_flag,
i.consignment_source_hub_type,
i.consignment_destination_hub_type,
i.consignment_source_hub_id as consignment_source_hub_id,
i.consignment_destination_hub_id as consignment_destination_hub_id,
lookupkey('facility_id',i.consignment_source_hub_id) AS consignment_source_hub_id_key,
lookupkey('facility_id',i.consignment_destination_hub_id) AS consignment_destination_hub_id_key,
i.connection_cut_off_datetime AS connection_cut_off_datetime,
i.consignment_create_datetime AS consignment_create_datetime,
i.consignment_status_date_time AS consignment_status_date_time,
i.consignment_eta_datetime AS consignment_eta_datetime,
i.consignment_received_datetime AS consignment_received_datetime,
i.consignment_awb_number,
i.connection_vehicle_no
from bigfoot_external_neo.scp_ekl__consignment_l1_90_fact i
left join bigfoot_external_neo.scp_ekl__shipment_consignment_map_l1_90_fact h on i.consignment_id = CAST(SPLIT(h.consignment_id, "-")[1] AS INT)
where i.consignment_type = 'SHIPMENT') a
left join (select entityid as bag_id, `data`.current_location.id as current_location,min(updatedat) as bag_inscan from bigfoot_journal.dart_wsr_scp_ekl_shipmentgroup_3 where day  > date_format(date_sub(current_date,90),'yyyyMMdd') and `data`.status in ('REACHED','CLOSED') and `data`.type = 'bag' group by entityid,`data`.current_location.id) d on CAST(SPLIT(d.bag_id, "-")[1] AS INT)  = a.bag_id and a.consignment_destination_hub_id = d.current_location 
left join bigfoot_external_neo.scp_ekl__shipment_l1_90_fact f on f.vendor_tracking_id = a.vendor_tracking_id
left join 
(select 
`data`.vendor_tracking_id as vendor_tracking_id,
`data`.shipment_type,
`data`.current_address.id as current_address, 
min(updatedat) as shipment_inscan,
max(data.shipment_weight.volumetric_details.breadth) as length,
max(data.shipment_weight.volumetric_details.breadth) as breadth,
max(data.shipment_weight.volumetric_details.height) as height,
max(data.shipment_weight.physical) as physical,
max(data.contour_volume) as contour_volume
from bigfoot_journal.dart_wsr_scp_ekl_shipment_4  
where day  > date_format(date_sub(current_date,90),'yyyyMMdd') and  `data`.status = 'Received' group by `data`.vendor_tracking_id,`data`.current_address.id,`data`.shipment_type
) 
e on e.vendor_tracking_id = a.vendor_tracking_id and a.consignment_destination_hub_id = e.current_address and e.shipment_type = If(f.ekl_shipment_type like '%rto%' and f.rto_create_datetime > a.consignment_create_datetime,'forward',f.ekl_shipment_type)
left join bigfoot_external_neo.scp_ekl__bag_l1_90_fact g on g.bag_id = a.bag_id
LEFT OUTER JOIN
(select p.vendor_tracking_id,p.maxim as maxim_v,min(r.product_id) as fsn_id from
(select vendor_tracking_id, max(item_value) as maxim , min(item_quantity) as minqty
from bigfoot_external_neo.scp_ekl__shipment_item_l1_90_fact
where vendor_tracking_id <> 'not_assigned'
group by vendor_tracking_id) p
inner join
bigfoot_external_neo.scp_ekl__shipment_item_l1_90_fact r
on p.vendor_tracking_id=r.vendor_tracking_id and p.maxim=r.item_value and p.minqty = r.item_quantity
where p.vendor_tracking_id <> 'not_assigned'
group by p.vendor_tracking_id,p.maxim) fsn_table
ON a.vendor_tracking_id=fsn_table.vendor_tracking_id
left join 
bigfoot_external_neo.scp_ekl__hub_notes_fact H on H.vendor_tracking_id = a.vendor_tracking_id
left join
bigfoot_external_neo.scp_fulfillment__fulfillment_cartman_weight_fact as pr 
on pr.vendortrackingid=a.vendor_tracking_id;

INSERT overwrite TABLE profiler_weight_volume_category_estimate_l1_hive_fact 
SELECT   analytic_category, 
         percentile(cast(shipment_dead_weight AS  int),0.5) AS median_category_dead_weight,
         percentile(cast(profiled_volume_in_gms AS int),0.5) AS median_category_vol_weight,
         percentile(cast(seller_volumetric_weight AS int),0.5) AS category_median_seller_vol_weight,
		 current_timestamp() as etl_time,
		 percentile(cast(seller_dead_weight AS int),0.5) AS category_median_seller_dead_weight
FROM     bigfoot_external_neo.scp_ekl__profiler_weight_volume_estimate_l0_hive_fact 
GROUP BY analytic_category;

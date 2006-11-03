#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../../config/environment'

StoreDimension.create(
  :store_name => 'Foo', 
  :store_number => 'ABC1', 
  :store_street_address => '101 SW 1st Street', 
  :store_city => 'Miami', 
  :store_county => 'Miami-Dade',
  :store_state => 'Florida',
  :store_zip_code => '33143',
  :store_manager => 'Bob Smith',
  :store_district => 'South Florida',
  :store_region => 'Southeast',
  :floor_plan_type => 'XXX',
  :photo_processing_type => '24 Hour',
  :financial_service_type => 'XXX',
  :selling_square_footage => 10300,
  :total_square_footage => 12390,
  :first_open_date => 1, # FK with view on date_dimension
  :last_remodal_date => 600 # FK with view on date_dimension
)
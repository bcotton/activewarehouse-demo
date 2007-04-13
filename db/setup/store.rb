#!/usr/bin/env ruby

stores = [
  ['Store 1','Store 1','101 SW 1st Street','Miami','Miami-Dade','FL','Florida','33143','Bob Smith','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 2','Store 2','300 SW 42nd Ave','South Miami','Miami-Dade','FL','Florida','33148','John Toms','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 3','Store 3','2000 Smith Stree','Boca Raton','Boca Raton','FL','Florida','37840','Jane Doe','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 4','Store 4','11 Babcock Street','Melbourne','Brevard','FL','Florida','32911','Jeff Smith','Central Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 5','Store 5','101 SW 1st Street','Orlando','Orange','FL','Florida','36544','Joe Johnson','Central Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 6','Store 6','101 SW 1st Street','Jacksonville','Miami-Dade','FL','Florida','33143','Bob Smith','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 7','Store 7','11 Broadway','New York','New York','NY','New York','00101','John Smith','New York','Northeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600]
]

connection = StoreDimension.connection
connection.execute("TRUNCATE TABLE #{StoreDimension.table_name}")

order = [:store_name, :store_number, :store_street_address, :store_city, :store_county, :store_state,
:store_state_name, :store_zip_code, :store_manager, :store_district, :store_region, :floor_plan_type,
:photo_processing_type, :financial_service_type, :selling_square_footage, :total_square_footage,
:first_open_date, :last_remodal_date]

stores.each do |store|
  attributes = {}
  order.each_with_index { |field, index| attributes[field] = store[index]}
  StoreDimension.create!(attributes)
end

#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../../config/environment'

stores = [
  ['Store 1','Store 1','101 SW 1st Street','Miami','Miami-Dade','Florida','33143','Bob Smith','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 2','Store 2','300 SW 42nd Ave','South Miami','Miami-Dade','Florida','33148','John Toms','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 3','Store 3','2000 Smith Stree','Boca Raton','Boca Raton','Florida','37840','Jane Doe','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 4','Store 4','11 Babcock Street','Melbourne','Brevard','Florida','32911','Jeff Smith','Central Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 5','Store 5','101 SW 1st Street','Orlando','Orange','Florida','36544','Joe Johnson','Central Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 6','Store 6','101 SW 1st Street','Jacksonville','Miami-Dade','Florida','33143','Bob Smith','South Florida','Southeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600],
  ['Store 7','Store 7','11 Broadway','New York','New York','New York','00101','John Smith','New York','Northeast','XXX','24 Hour','XXX', 10300, 12390, 1, 600]
]

StoreDimension.delete_all

stores.each do |store|
  StoreDimension.create(
    :store_name => store[0], 
    :store_number => store[1], 
    :store_street_address => store[2], 
    :store_city => store[3],
    :store_county => store[4],
    :store_state => store[5],
    :store_zip_code => store[6],
    :store_manager => store[7],
    :store_district => store[8],
    :store_region => store[9],
    :floor_plan_type => store[10],
    :photo_processing_type => store[11],
    :financial_service_type => store[12],
    :selling_square_footage => store[13],
    :total_square_footage => store[14],
    :first_open_date => store[15], # FK with view on date_dimension
    :last_remodal_date => store[16] # FK with view on date_dimension
  )
end

class RegionalSalesCube < ActiveWarehouse::Cube
  pivots_on :store, :date
  reports_on :pos_retail_sales_transaction
end
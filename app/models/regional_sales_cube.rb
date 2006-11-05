class RegionalSalesCube < ActiveWarehouse::Cube
  pivots_on :date, :store
  reports_on :pos_retail_sales_transaction
end
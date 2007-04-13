class ProductSalesCube < ActiveWarehouse::Cube
  reports_on :pos_retail_sales_transaction
  pivots_on :date, :product, :store
end
class ProductSalesCube < ActiveWarehouse::Cube
  pivots_on :date, :product, :store
  reports_on :pos_retail_sales_transaction
end
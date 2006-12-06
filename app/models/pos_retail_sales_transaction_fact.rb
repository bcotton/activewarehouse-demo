class PosRetailSalesTransactionFact < ActiveWarehouse::Fact
  aggregate :sales_quantity#, :type => :sum
  aggregate :sales_dollar_amount#, :type => :sum
  aggregate :gross_profit_dollar_amount#, :type => :sum
  
  calculated_field (:gross_margin) { |agg_rec| agg_rec.gross_profit_dollar_amount / agg_rec.sales_dollar_amount}
  
  belongs_to :date, :foreign_key => 'date_id', :class_name => 'DateDimension'
  belongs_to :store, :foreign_key => 'store_id', :class_name => 'StoreDimension'
  belongs_to :product, :foreign_key => 'product_id', :class_name => 'ProductionDimension'
  belongs_to :promotion, :foreign_key => 'promotion_id', :class_name => 'PromotionDimension'
end
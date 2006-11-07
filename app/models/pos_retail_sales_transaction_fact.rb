class PosRetailSalesTransactionFact < ActiveWarehouse::Fact
  define_aggregate :sales_quantity, :type => :sum
  define_aggregate :sales_dollar_amount, :type => :sum
  belongs_to :date, :foreign_key => 'date_id', :class_name => 'DateDimension'
  belongs_to :store, :foreign_key => 'store_id', :class_name => 'StoreDimension'
end
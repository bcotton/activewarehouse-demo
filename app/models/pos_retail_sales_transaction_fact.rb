class PosRetailSalesTransactionFact < ActiveWarehouse::Fact
  define_aggregate :sales_quantity, :type => :sum
  define_aggregate :sales_dollar_amount, :type => :sum
end
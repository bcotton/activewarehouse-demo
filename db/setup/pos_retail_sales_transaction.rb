#!/usr/bin/env ruby

facts = [
  [1, 1, 1, 1, 'ABC000000001', 3, 3.00, 1.50],
  [366, 3, 1, 1, 'ABC000000002', 1, 1.00, 0.50],
  [732, 3, 1, 1, 'ABC000000003', 2, 2.00, 1.00],
  [1098, 3, 1, 1, 'ABC000000004', 1, 1.00, 0.50],
  [1098, 2, 1, 1, 'ABC000000005', 1, 1.00, 0.50],
  [1098, 1, 1, 1, 'ABC000000006', 2, 2.00, 1.00],
  [1, 1, 2, 1, 'DEF000000001', 3, 3.00, 1.50],
  [300, 3, 2, 1, 'DEF000000002', 1, 1.00, 0.50],
  [600, 3, 2, 1, 'DEF000000003', 2, 2.00, 1.00],
  [1800, 3, 2, 1, 'DEF000000004', 1, 1.00, 0.50]
]

connection = PosRetailSalesTransactionFact.connection
connection.execute("TRUNCATE TABLE #{PosRetailSalesTransactionFact.table_name}")

facts.each do |fact|
  PosRetailSalesTransactionFact.create(
    :date_id => fact[0],
    :product_id => fact[1],
    :store_id => fact[2],
    :promotion_id => fact[3],
    :pos_transaction_number => fact[4],
    :sales_quantity => fact[5],
    :sales_dollar_amount => fact[6],
    :cost_dollar_amount => fact[7],
    :gross_profit_dollar_amount => fact[6] - fact[7]
  )
end
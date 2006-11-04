#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../../config/environment'

facts = [
  [1, 1, 1, 1, 'ABC000000001', 3, 3.45, 1.56],
  [300, 3, 1, 1, 'ABC000000002', 1, 1.34, 0.72],
  [600, 3, 1, 1, 'ABC000000003', 2, 2.68, 1.44],
  [1800, 3, 1, 1, 'ABC000000004', 1, 1.34, 0.72],
  [1, 1, 1, 1, 'DEF000000001', 3, 3.45, 1.56],
  [300, 3, 2, 1, 'DEF000000002', 1, 1.34, 0.72],
  [600, 3, 2, 1, 'DEF000000003', 2, 2.68, 1.44],
  [1800, 3, 2, 1, 'DEF000000004', 1, 1.34, 0.72]
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
class CreatePosRetailSalesTransactionFacts < ActiveRecord::Migration
  def self.up
    create_table :pos_retail_sales_transaction_facts do |t|
      t.column :date_id, :integer
      t.column :product_id, :integer
      t.column :store_id, :integer
      t.column :promotion_id, :integer
      t.column :pos_transaction_number, :string, :limit => 30
      t.column :sales_quantity, :integer
      t.column :sales_dollar_amount, :"double precision"
      t.column :cost_dollar_amount, :"double precision"
      t.column :gross_profit_dollar_amount, :"double precision"
    end
  end

  def self.down
    drop_table :pos_retail_sales_transaction_facts
  end
end

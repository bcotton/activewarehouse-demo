class CreateSalesFacts < ActiveRecord::Migration
  def self.up
    create_table :sales_facts do |t|
      t.column :time_id, :integer
      t.column :region_id, :integer
      t.column :person_id, :integer
      t.column :total_sales_amount, :double
      t.column :items_sold, :integer
    end
  end

  def self.down
    drop_table :sales_facts
  end
end

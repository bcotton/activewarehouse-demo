class CreateDateDimension < ActiveRecord::Migration
  def self.up
    create_table :date_dimension do |t|
      t.column :year, :string
      t.column :quarter, :string
      t.column :month, :string
      t.column :week, :string
      t.column :day, :string
    end
  end

  def self.down
    drop_table :date_dimension
  end
end

class CreateRegionDimension < ActiveRecord::Migration
  def self.up
    create_table :region_dimension do |t|
      t.column :name, :string
      t.column :country, :string
    end
  end

  def self.down
    drop_table :region_dimension
  end
end

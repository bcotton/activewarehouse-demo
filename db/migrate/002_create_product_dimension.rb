class CreateProductDimension < ActiveRecord::Migration
  def self.up    
    fields = {
      :product_description => :string,
      :sku_number => :integer,
      :brand_description => :string,
      :category_description => :string,
      :department_description => :string,
      :package_type_description => :string,
      :package_size => :string,
      :fat_content => :string,
      :diet_type => :string,
      :weight => :integer,
      :weight_units_of_measure => :string,
      :storage_type => :string,
      :shelf_life_type => :string,
      :shelf_width => :string,
      :shelf_height => :string,
      :shelf_depth => :string,
    }
    
    create_table :product_dimension do |t|
      fields.each do |name,type|
        t.column name, type
      end
    end
    fields.each do |name,type|
      add_index :product_dimension, name unless type == :text      
    end
  end

  def self.down
    drop_table :product_dimension
  end
end

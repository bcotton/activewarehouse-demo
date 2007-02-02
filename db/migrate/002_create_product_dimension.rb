class CreateProductDimension < ActiveRecord::Migration
  def self.up    
    fields = {
      :product_description => {:type => :string, :limit => 50},
      :sku_number => :integer,
      :brand_description => {:type => :string, :limit => 30},
      :category_description => {:type => :string, :limit => 30},
      :department_description => {:type => :string, :limit => 30},
      :package_type_description => {:type => :string, :limit => 30},
      :package_size => {:type => :string, :limit => 30},
      :fat_content => {:type => :string, :limit => 20},
      :diet_type => {:type => :string, :limit => 20},
      :weight => :integer,
      :weight_units_of_measure => {:type => :string, :limit => 20},
      :storage_type => {:type => :string, :limit => 20},
      :shelf_life_type => {:type => :string, :limit => 20},
      :shelf_width => {:type => :string, :limit => 20},
      :shelf_height => {:type => :string, :limit => 20},
      :shelf_depth => {:type => :string, :limit => 20},
    }
    create_table :product_dimension do |t|
      fields.each do |name,options|
        case options
        when Symbol
          t.column name, options
        when Hash
          type = options.delete(:type)
          t.column name, type, options
        end
      end
    end
    fields.each do |name,options|
      case options
      when Symbol
        add_index :product_dimension, name unless options == :text
      when Hash
        add_index :product_dimension, name unless options[:type] == :text
      end
    end
  end

  def self.down
    drop_table :product_dimension
  end
end

class CreateStoreDimension < ActiveRecord::Migration
  def self.up
    fields = {
      :store_name => {:type => :string, :limit => 50},
      :store_number => :integer,
      :store_street_address => {:type => :string, :limit => 50},
      :store_city => {:type => :string, :limit => 20},
      :store_county => {:type => :string, :limit => 20},
      :store_state => {:type => :string, :limit => 2},
      :store_state_name => {:type => :string, :limit => 40},
      :store_zip_code => {:type => :string, :limit => 10},
      :store_manager => {:type => :string, :limit => 30},
      :store_district => {:type => :string, :limit => 20},
      :store_region => {:type => :string, :limit => 20},
      :floor_plan_type => {:type => :string, :limit => 20},
      :photo_processing_type => {:type => :string, :limit => 20},
      :financial_service_type => {:type => :string, :limit => 20},
      :selling_square_footage => :integer,
      :total_square_footage => :integer,
      :first_open_date => :integer, # FK with view on date_dimension
      :last_remodal_date => :integer, # FK with view on date_dimension
    }
    create_table :store_dimension do |t|
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
        add_index :store_dimension, name unless options == :text
      when Hash
        add_index :store_dimension, name unless options[:type] == :text
      end
    end
  end

  def self.down
    drop_table :store_dimension
  end
end

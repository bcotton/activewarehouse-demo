class CreatePromotionDimension < ActiveRecord::Migration
  def self.up
    fields = {
      :promotion_name => {:type => :string, :limit => 30},
      :price_reduction_type => {:type => :string, :limit => 30},
      :promotion_media_type => {:type => :string, :limit => 30},
      :ad_type => {:type => :string, :limit => 30},
      :display_type => {:type => :string, :limit => 30},
      :coupon_type => {:type => :string, :limit => 30},
      :ad_media_name => {:type => :string, :limit => 30},
      :display_provider => {:type => :string, :limit => 30},
      :promotion_cost => :integer,
      :promotion_begin_date => :integer, # FK with date_dimension view
      :promotion_end_date => :integer, # FK with date_dimension view
    }
    create_table :promotion_dimension do |t|
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
        add_index :promotion_dimension, name unless options == :text
      when Hash
        add_index :promotion_dimension, name unless options[:type] == :text
      end
    end
  end

  def self.down
    drop_table :promotion_dimension
  end
end

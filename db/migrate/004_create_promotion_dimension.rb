class CreatePromotionDimension < ActiveRecord::Migration
  def self.up
    fields = {
      :promotion_name => :string,
      :price_reduction_type => :string,
      :promotion_media_type => :string,
      :ad_type => :string,
      :display_type => :string,
      :coupon_type => :string,
      :ad_media_name => :string,
      :display_provider => :string,
      :promotion_cost => :integer,
      :promotion_begin_date => :integer, # FK with date_dimension view
      :promotion_end_date => :integer, # FK with date_dimension view
    }
    create_table :promotion_dimension do |t|
      fields.each do |name,type|
        t.column name, type
      end
    end
    fields.each do |name,type|
      add_index :promotion_dimension, name unless type == :text      
    end
  end

  def self.down
    drop_table :promotion_dimension
  end
end

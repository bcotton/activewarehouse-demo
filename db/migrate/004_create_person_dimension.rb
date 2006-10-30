class CreatePersonDimension < ActiveRecord::Migration
  def self.up
    create_table :person_dimension do |t|
      t.column :name, :string
      t.column :ssn, :string
    end
  end

  def self.down
    drop_table :person_dimension
  end
end

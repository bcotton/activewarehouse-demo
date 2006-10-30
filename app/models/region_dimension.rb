class RegionDimension < ActiveWarehouse::Dimension
  acts_as_hierarchy :levels => [:name, :country]
end
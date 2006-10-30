class RegionDimension < ActiveWarehouse::Dimension
  acts_as_hierarchy :levels => [:country]
end
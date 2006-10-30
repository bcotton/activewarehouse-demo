class DateDimension < ActiveWarehouse::Dimension
  acts_as_hierarchy :levels => [:year,:quarter,:month,:week,:day]
end
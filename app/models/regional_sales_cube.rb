class RegionalSalesCube < ActiveWarehouse::Cube
  pivots_on :region, :time
  reports_on :sales
end
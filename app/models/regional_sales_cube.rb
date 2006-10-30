class RegionalSalesCube < ActiveWarehouse::Cube
  pivots_on :region, :date
  reports_on :sales
end
require File.dirname(__FILE__) + '/../test_helper'

class RegionDimensionTest < Test::Unit::TestCase
  fixtures :region_dimension

  def test_find
    assert_not_nil RegionDimension.find(:all)
    assert_equal 2, RegionDimension.count
  end
end

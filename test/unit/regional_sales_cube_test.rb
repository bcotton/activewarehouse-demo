require File.dirname(__FILE__) + '/../test_helper'

class RegionalSalesCubeTest < Test::Unit::TestCase
  def test_dimensions
    assert_equal 2, RegionalSalesCube.dimensions.length
    assert_not_nil RegionalSalesCube.fact
  end
end

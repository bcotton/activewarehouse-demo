require File.dirname(__FILE__) + '/../test_helper'

class DateDimensionTest < Test::Unit::TestCase
  fixtures :date_dimension

  def test_find
    assert_not_nil DateDimension.find(:all)
    assert_equal 2, DateDimension.count
  end
  
  def test_time_hierarchy
    assert_equal [:year,:quarter,:month,:week,:day], DateDimension.levels 
  end
end

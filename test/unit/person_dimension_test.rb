require File.dirname(__FILE__) + '/../test_helper'

class PersonDimensionTest < Test::Unit::TestCase
  fixtures :person_dimension

  def test_find
    assert_not_nil PersonDimension.find(:all)
    assert_equal 2, PersonDimension.count
  end
  
end

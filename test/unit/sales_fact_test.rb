require File.dirname(__FILE__) + '/../test_helper'

class SalesFactTest < Test::Unit::TestCase
  fixtures :sales_facts

  def test_find
    assert_not_nil SalesFact.find(:all)
    assert_equal 2, SalesFact.count
  end
  
  def test_dimensions
    assert_equal 3, SalesFact.dimensions.length
  end
end

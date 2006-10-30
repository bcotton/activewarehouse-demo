require File.dirname(__FILE__) + '/../test_helper'

class DateDimensionTest < Test::Unit::TestCase
  fixtures :date_dimension

  def test_find
    assert_not_nil DateDimension.find(:all)
    assert_equal 2, DateDimension.count
  end
  
  def test_time_hierarchy
    assert_equal [:year,:quarter,:month,:week,:day], DateDimension.levels
    
    root_node = DateDimension.hierarchy
    assert_equal "All", root_node.value
    
    assert_equal 1, root_node.children.length
    year_node = root_node.child('2001')
    assert_equal 1, year_node.children.length    
    quarter_node = year_node.child('Q1')
    assert_equal 1, quarter_node.children.length
    month_node = quarter_node.child('January')
    assert_equal 1, month_node.children.length
    week_node = month_node.child('Week 1')
    assert_equal 2, week_node.children.length
  end
  
  def test_nodes_at_level
    #assert_equal 1, DateDimension.nodes_at_level(:year).length
    #assert_equal 1, DateDimension.nodes_at_level(:quarter).length
    #assert_equal 1, DateDimension.nodes_at_level(:month).length
    #assert_equal 1, DateDimension.nodes_at_level(:week).length
    #assert_equal 2, DateDimension.nodes_at_level(:day).length
  end
end

class DemoController < ApplicationController

  def index
    render :action => "demo/index", :layout => "application"
  end
  
  def example1
    
  end
  def example2

  end
  def example3

  end
  def example4
    # TODO: this is ugly as sin right now. I need to clean it up and put it into a helper
    
    @pivots = []
    index = 0
    ProductSalesCube.dimensions.each do |dim|
      dim_class = ActiveWarehouse::Dimension.class_for_name(dim)
      dim_class.hierarchies.each do |hierarchy|
        @pivots << {:dimension => dim, :hierarchy => hierarchy, :name => "#{dim}/#{hierarchy}", :index => index}
        index += 1
      end
    end
    
    @col_dimension = params[:cd] || :date
    @col_hierarchy = params[:ch] || :cy
    if params[:col_pivot]
      col_pivot = @pivots[params[:col_pivot].to_i]
      @col_dimension = col_pivot[:dimension]
      @col_hierarchy = col_pivot[:hierarchy]
    end
    
    @row_dimension = params[:rd] || :product
    @row_hierarchy = params[:rh] || :product
    if params[:row_pivot]
      row_pivot = @pivots[params[:row_pivot].to_i]
      @row_dimension = row_pivot[:dimension]
      @row_hierarchy = row_pivot[:hierarchy]
    end
    
    puts "@col_dimension=#{@col_dimension}"
    puts "@col_hierarchy=#{@col_hierarchy}"
    puts "@row_dimension=#{@row_dimension}"
    puts "@row_hierarchy=#{@row_hierarchy}"
    
    params[:cd] = @col_dimension = @col_dimension.to_sym
    params[:ch] = @col_hierarchy = @col_hierarchy.to_sym
    params[:rd] = @row_dimension = @row_dimension.to_sym
    params[:rh] = @row_hierarchy = @row_hierarchy.to_sym
    
  end
  
  def fact_list
    @facts = PosRetailSalesTransactionFact.find(
      :all, :include => [:date, :store])
  end
  def date_dimension
    @dimension_pages, @dimension_records = paginate(:date_dimension, :per_page => 30)
  end
end

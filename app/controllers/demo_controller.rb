class DemoController < ApplicationController

  def index
    render :action => "demo/index", :layout => "application"
  end
  def example1
    
  end
  def fact_list
    @facts = PosRetailSalesTransactionFact.find(
      :all, :include => [:date, :store])
  end
end

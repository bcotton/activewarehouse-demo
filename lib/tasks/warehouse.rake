namespace :warehouse do
  desc "Rebuild the warehouse" # TODO: extract into a generic rake task for AW plugin
  task :rebuild => :environment do
    RegionalSalesCube.rebuild(:force => true)
    ProductSalesCube.rebuild(:force => true)
  end
end
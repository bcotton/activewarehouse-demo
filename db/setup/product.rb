#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../../config/environment'

products = [
  ['Crunchy Chips', '00399494302', 'Delicious Brands', 'Snack Foods', 'Snack Foods', 'Bag', 'Small', 'Regular Fat', 24, 'Ounces', 'Non Refrigerated', '3 Years', 6, 12, 3],
  ['Low Fat Crunchy Chips', '00399494303', 'Delicious Brands', 'Snack Foods', 'Snack Foods', 'Bag', 'Small', 'Low Fat', 24, 'Ounces', 'Non Refrigerated', '3 Years', 6, 12, 3],
  ['Family-Sized Crunchy Chips', '00399494304', 'Delicious Brands', 'Snack Foods', 'Snack Foods', 'Bag', 'Large', 'Regular Fat', 64, 'Ounces', 'Non Refrigerated', '3 Years', 8, 16, 3],
  ['Wingdings', '003994943016', 'Yum Brands', 'Snack Foods', 'Snack Foods', 'Box', 'Small', 'Regular Fat', 12, 'Ounces', 'Non Refrigerated', '5 Years', 8, 2, 3],
  ['White Bread', '0035405043', 'Wholesome', 'Bread', 'Bakery', 'Bag', 'Medium', 'Regular Fat', 48, 'Pieces', 'Non Refrigerated', '9 Months', 12, 4, 4],
  ['Low Fat White Bread', '0035405044', 'Wholesome', 'Bread', 'Bakery', 'Bag', 'Medium', 'Low Fat', 48, 'Pieces', 'Non Refrigerated', '9 Months', 12, 4, 4],
  ['Wheat Bread', '0035405050', 'Wholesome', 'Bread', 'Bakery', 'Bag', 'Medium', 'Low Fat', 48, 'Pieces', 'Non Refrigerated', '9 Months', 12, 4, 4],
]

connection = ProductDimension.connection
connection.execute("TRUNCATE TABLE #{ProductDimension.table_name}")

products.each do |product|
  ProductDimension.create(
    :product_description => product[0],
    :sku_number => product[1],
    :brand_description => product[2],
    :category_description => product[3],
    :department_description => product[4],
    :package_type_description => product[5],
    :package_size => product[6],
    :fat_content => product[7],
    :diet_type => product[8],
    :weight => product[9],
    :weight_units_of_measure => product[10],
    :storage_type => product[11],
    :shelf_life_type => product[12],
    :shelf_width => product[13],
    :shelf_height => product[14],
    :shelf_depth => product[15]
  )
end

#!/usr/bin/env ruby

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

order = [
  :product_description, :sku_number, :brand_description, :category_description, :department_description,
  :package_type_description, :package_size, :fat_content, :diet_type, :weight, :weight_units_of_measure,
  :storage_type, :shelf_life_type, :shelf_width, :shelf_height, :shelf_depth
]

products.each do |product|
  attributes = {}
  order.each_with_index { |field, index| attributes[field] = product[index] }
  ProductDimension.create(attributes)
end

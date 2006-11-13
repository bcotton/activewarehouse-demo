class ProductDimension < ActiveWarehouse::Dimension
  define_hierarchy :product, [:department_description, :category_description, :brand_description]
end
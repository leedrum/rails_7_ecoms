# frozen_string_literal: true
# typed: false

ActiveAdmin.register Product do
  index do
    selectable_column
    id_column
    column :name
    column :description do |product|
      product.description.truncate(50)
    end
    column :price
    column :quantity
    column :category do |product|
      link_to product.category.name, admin_category_path(product.category)
    end
    column :created_at
    column :updated_at
    actions
  end

  permit_params :name, :description, :price, :quantity, :category_id

  filter :name, as: :string
  filter :description, as: :string
  filter :price
  filter :quantity
  filter :category, as: :select, collection: proc { Category.all.map { |c| [c.name, c.id] } }
end

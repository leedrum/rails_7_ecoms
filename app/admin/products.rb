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

  permit_params :name, :description, :price, :quantity, :category_id, images: []

  filter :name, as: :string
  filter :description, as: :string
  filter :price
  filter :quantity
  filter :category, as: :select, collection: proc { Category.all.map { |c| [c.name, c.id] } }

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      li do
        f.label :category_id
        collection_select = Category.all.map { |c| [c.name, c.id] }
        f.select :category_id, collection_select, include_blank: true, selected: f.object.category_id
      end
      f.object.images.each do |image|
        f.hidden_field :images, multiple: true, value: image.signed_id
        image_tag url_for(image)
      end
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :quantity
      row :category do |product|
        link_to product.category.name, admin_category_path(product.category)
      end
      row :images do
        div do
          product.images.each do |img|
            div do
              image_tag url_for(img), size: '150x150'
            end
          end
        end
      end
    end
  end
end

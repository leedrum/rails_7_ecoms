# frozen_string_literal: true
# typed: false

ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column :name
    column :ancestry

    column :parent do |category|
      next if category.ancestry.blank? || category.ancestry == '/'

      link_to category.parent.name, category_path(category.parent)
    end
    column :created_at
    actions
  end

  filter :name
  filter :ancestry
  filter :created_at

  permit_params :name, :parent_id

  form do |f|
    f.inputs do
      f.input :name
      if f.object.persisted?
        li do
          f.label :parent_id
          collection_select = Category.where.not(id: (f.object.path_ids - [f.object.parent_id] + f.object.subtree_ids)).map { |c| [c.name, c.id] }
          f.select :parent_id, collection_select, include_blank: true, selected: f.object.parent_id
        end
      end
    end
    f.actions
  end
end

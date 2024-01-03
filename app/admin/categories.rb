ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column :name
    column :ancestry
    column :created_at
    actions
  end

  filter :name
  filter :ancestry
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :ancestry
    end
    f.actions
  end

end

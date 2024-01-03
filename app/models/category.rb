class Category < ApplicationRecord
  has_ancestry

  def self.ransackable_attributes(auth_object = nil)
    ["ancestry", "created_at", "description", "id", "id_value", "name", "updated_at"]
  end
end

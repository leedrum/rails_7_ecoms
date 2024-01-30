# typed: false
# frozen_string_literal: true

# Path: app/models/category.rb
class Category < ApplicationRecord
  has_ancestry

  def self.ransackable_attributes(_auth_object = nil)
    %w[ancestry created_at description id id_value name updated_at]
  end
end

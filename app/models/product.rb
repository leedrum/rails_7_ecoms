# typed: false
# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  acts_as_paranoid

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at deleted_at description id id_value name price quantity updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category]
  end
end

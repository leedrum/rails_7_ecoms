# typed: false
# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  acts_as_paranoid
end

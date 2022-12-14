# frozen_string_literal: true

class Contract < ApplicationRecord
  belongs_to :company
  validates :name, presence: true
end

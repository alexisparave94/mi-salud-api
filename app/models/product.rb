class Product < ApplicationRecord
  # Validations
  validates :cod_product, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_price, numericality: { greater_than_or_equal_to: 0 }
  validates :laboratory, inclusion: { in: %w[Genfar GSK Hersil FarmaIndustria] }
end

class Subcategoria < ActiveRecord::Base
  belongs_to :categoria
  has_many :ticket
  has_many :know
end

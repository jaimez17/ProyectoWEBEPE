class Know < ActiveRecord::Base
  belongs_to :area
  belongs_to :categoria
  belongs_to :subcategoria
end

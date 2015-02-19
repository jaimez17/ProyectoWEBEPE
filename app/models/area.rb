class Area < ActiveRecord::Base
  belongs_to :empresa
  has_many :categoria
  has_many :empleados
  has_many :ticket
  has_many :know
end

class Contrasenas < ActiveRecord::Migration
  def change
    add_column :empleados, :password, :string
    add_column :usuarios, :password, :string
    add_column :users, :password, :string
  end
end

class MuereRoleId < ActiveRecord::Migration
  def change
    remove_column :usuarios, :role_id
  end
end

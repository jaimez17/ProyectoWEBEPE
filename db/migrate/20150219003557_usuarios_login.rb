class UsuariosLogin < ActiveRecord::Migration
  def change
    add_column :usuarios, :provider, :string
    add_column :usuarios, :uid, :string
    add_column :usuarios, :name, :string
    add_column :usuarios, :oauth_token, :string
    add_column :usuarios, :oauth_expires_at, :datetime
  end
end

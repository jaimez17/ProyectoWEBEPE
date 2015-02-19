class ComentraiosClomuns < ActiveRecord::Migration
  def change
    change_column :comentarios, :created_at, :datetime, :null => true, :default => nil
  end
end

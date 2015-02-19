class CreateKnows < ActiveRecord::Migration
  def change
    create_table :knows do |t|
      t.string :name
      t.string :descripcion

      t.timestamps null: false
    end
  end
end

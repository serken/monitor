class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.integer :dashboard_id
      t.text :code
      t.integer :pos_x
      t.integer :pos_y
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end

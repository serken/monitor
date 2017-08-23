class ChangeWidgets < ActiveRecord::Migration[5.0]
  def change
    change_column :widgets, :width, :float
    change_column :widgets, :height, :float
    add_column :widgets, :scale_x, :float, default: 1.0
    add_column :widgets, :scale_y, :float, default: 1.0
  end
end

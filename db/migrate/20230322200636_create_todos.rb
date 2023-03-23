class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0
      t.integer :priority, null: false, default: 0

      t.timestamps
    end
  end
end

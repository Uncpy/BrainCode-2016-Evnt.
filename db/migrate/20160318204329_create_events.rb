class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :events, [:user_id, :created_at]
  end
end

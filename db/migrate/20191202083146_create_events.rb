class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :place

      t.timestamps
    end
  end
end

class CreatePigs < ActiveRecord::Migration[7.0]
  def change
    create_table :pigs do |t|
      t.string :name
      t.string :breed
      t.text :habits
      t.text :image

      t.timestamps
    end
  end
end

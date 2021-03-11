class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.text :payload, null: false
      t.references :bin, foreign_key: true
      t.timestamps
    end
  end
end

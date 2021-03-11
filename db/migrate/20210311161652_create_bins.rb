class CreateBins < ActiveRecord::Migration[6.0]
  def change
    create_table :bins do |t|
      t.string :slug, null: false
      t.timestamps
    end
  end
end

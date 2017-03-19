class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :unit_id
      t.string :item_code
      t.string :item_group_id
      t.text :description
      t.references :item_group, index:true
      t.timestamps
    end
  end
end

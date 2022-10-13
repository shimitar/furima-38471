class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
     t.string     :post_code, null: false
     t.integer    :sender_id, null: false
     t.string     :street,    null: false
     t.string     :address,   null: false
     t.string     :building_name
     t.string     :phone,     null: false
     t.references :buy,       null: false, foreign_key: true
     t.timestamps
    end
  end
end

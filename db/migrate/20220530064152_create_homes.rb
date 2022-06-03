class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string     :post_number,   null: false
      t.integer    :area_id,       null: false
      t.string     :city,          null: false
      t.string     :house_number,  null: false
      t.string     :bilding_name
      t.string     :phone_number,  null: false
      t.references :record,        null: false, foreign_key: true
      t.timestamps
    end
  end
end

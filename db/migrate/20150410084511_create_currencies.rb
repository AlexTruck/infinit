class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :title
      t.text   :banks_data

      t.timestamps   null: false
    end
  end
end
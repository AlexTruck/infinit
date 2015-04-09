class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string   :title
      t.string   :bank
      t.string   :cost_buy
      t.string   :cost_sale

      t.timestamps null: false
    end
  end
end

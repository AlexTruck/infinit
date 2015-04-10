class RemoveFieldsFromCurrency < ActiveRecord::Migration
  def change
    change_table :currencies do |t|
      t.remove :bank
      t.remove :cost_buy
      t.remove :cost_sale
    end
  end
end

class AddBanksDataToCurrency < ActiveRecord::Migration
  def change
    add_column :currencies, :banks_data, :text
  end
end

class Currency < ActiveRecord::Base
  validates :title, presence: true
  validates :bank, presence: true
  validates :cost_buy, presence: true
  validates :cost_sale, presence: true
end

class Currency < ActiveRecord::Base
  validates :title, presence: true
  validates :banks_data, presence: true

  serialize :banks_data, JSON
end

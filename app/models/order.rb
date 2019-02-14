class Order < ApplicationRecord
  belongs_to :batch, optional: true
  #validates :title, presence: true
end

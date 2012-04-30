class Item < ActiveRecord::Base
  belongs_to :drop
  belongs_to :style

  attr_accessible :binding, :colour, :customer_price, :customer_style, :drop_id, :factory_price, :heel, :line_number, :lining, :mda, :metals, :platform, :quantity, :sock, :sole, :style_id, :upper
  default_scope :order => "colour"

  validates :drop_id,         :presence => true
  validates :style_id,        :presence => true
  validates :colour,          :presence => true
  validates :quantity,        :presence => true
  validates :customer_price,  :presence => true
  validates :factory_price,   :presence => true
  validates :upper,           :presence => true
end

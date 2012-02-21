class Item < ActiveRecord::Base
  belongs_to :drop
  attr_accessible :binding, :colour, :customer_price, :customer_style, :factory_price, :heel, :line_number, :lining, :mda, :metals, :quantity, :sock, :sole
  default_scope :order => "colour"

  validates :colour,          :presence => true
  validates :customer_price,  :presence => true
  validates :factory_price,   :presence => true
  validates :quantity,        :presence => true

end

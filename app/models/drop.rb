class Drop < ActiveRecord::Base
  belongs_to :order
  has_many :items
  attr_accessible :factory_date, :customer_date, :consignee_id
  default_scope :order => "factory_date"

  validates :factory_date,         :presence => true
  validates :customer_date,        :presence => true

end

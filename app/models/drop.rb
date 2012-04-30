class Drop < ActiveRecord::Base
  belongs_to :order
  belongs_to :consignee
  has_many :items
  has_one :invoice

  attr_accessible :consignee_id, :customer_date, :factory_date, :order_id
  default_scope :order => "factory_date"

  validates :order_id,        :presence => true
  validates :consignee_id,    :presence => true
  validates :factory_date,    :presence => true
  validates :customer_date,   :presence => true
  validate  :validate_dates

  def validate_dates
    if customer_date && factory_date
      errors.add(:customer_date, "can't be earlier than Factory date") if customer_date < factory_date
    end
  end
end

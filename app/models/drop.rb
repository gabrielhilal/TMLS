class Drop < ActiveRecord::Base
  belongs_to :order
  belongs_to :consignee
  has_many :items
  has_one :invoice

  attr_accessible :factory_date, :customer_date, :consignee_id
  default_scope :order => "factory_date"

  validates :factory_date,         :presence => true
  validates :customer_date,        :presence => true
  validates :consignee_id,         :presence => true

  validate :validate_dates

    def validate_dates
      if customer_date && factory_date
        errors.add(:customer_date, "can't be earlier than Factory date'") if customer_date < factory_date
      end
    end

end

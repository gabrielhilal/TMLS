class Invoice < ActiveRecord::Base
  belongs_to :drop
  belongs_to :bank

  attr_accessible :cartoons, :cubic, :date, :drop_id, :gross, :hts, :net, :number, :paid, :factory_invoice, :vat, :bank_id
  default_scope :order => "date, number"

  validates :cartoons, :presence => true
  validates :cubic,    :presence => true
  validates :date,     :presence => true
  validates :drop_id,  :presence => true
  validates :gross,    :presence => true
  validates :net,      :presence => true
  validates :number,   :presence => true
  validates :vat,      :presence => true
  validates :bank_id,  :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ["number LIKE ?", "%#{search}%"])
    else
      find(:all)
    end
  end

end

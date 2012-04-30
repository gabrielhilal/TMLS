class Invoice < ActiveRecord::Base
  belongs_to :drop
  belongs_to :bank

  attr_accessible :bank_id, :cartoons, :cubic, :date, :drop_id, :factory_invoice, :gross, :hts, :net, :number, :paid, :vat
  default_scope :order => "date, number"

  validates :drop_id,   :presence => true
  validates :bank_id,   :presence => true
  validates :number,    :uniqueness => { :case_sensitive => false },
                        :presence => true
  validates :date,      :presence => true
  validates :cartoons,  :presence => true
  validates :gross,     :presence => true
  validates :net,       :presence => true
  validates :cubic,     :presence => true
  validates :vat,       :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ["number LIKE ?", "%#{search}%"])
    else
      find(:all)
    end
  end
end

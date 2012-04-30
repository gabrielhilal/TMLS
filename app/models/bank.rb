class Bank < ActiveRecord::Base
  has_many :invoices

  attr_accessible :account, :address, :bic, :iban, :name, :notice, :sort_code, :swift
  default_scope :order => "name"

  validates :name,        :uniqueness => { :case_sensitive => false },
                          :presence => true
  validates :account,     :presence => true
  validates :sort_code,   :presence => true
end

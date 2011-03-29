class Company < ActiveRecord::Base
  attr_accessible :name, :phone, :address, :city, :country

  # == Associations
  has_many :contacts

  # == Validations
  validates :name, :presence => true, :uniqueness => true


  COMPANY_SELECT_OPTIONS = [['Select Company', nil]] + Company.all.map{|x| [x.name, x.id]}

end

class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :avatar, :company, :twitter_handler, :company_attributes

  # == Associations
  belongs_to :company

  # == Validations
  validates :first_name, :last_name, :presence => true

  validates :email,
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :phone, :format => {:with => /^00[\s]\d{3}[\s]\d{6}$/}


  has_attached_file :avatar,
    :styles => { :thumb => "100x100>" },
    :default_url => "/images/dummy_100x100.png",
    :path => "public/system/:attachment/:id/:style/:basename.:extension"


  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end


  def full_name
    [self.last_name, self.first_name].join(', ')
  end

  def company_attributes=(company)
    self.company = Company.find_by_name(company[:name])
  end

  def twitters
    Twitter::Search.new.from(self.twitter_handler).fetch if self.twitter_handler 
  end
end






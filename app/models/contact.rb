class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :avatar, :company

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


  def full_name
    [self.last_name, self.first_name].join(', ')
  end
end

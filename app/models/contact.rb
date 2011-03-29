class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :avatar

  has_attached_file :avatar,
    :styles => { :thumb => "100x100>" },
    :default_url => "/images/dummy_100x100.png",
    :path => "public/system/:attachment/:id/:style/:basename.:extension"
end

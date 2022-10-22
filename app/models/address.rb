class Address < ApplicationRecord
  belongs_to :customer

  validates :name,presence:true
  validates :address,presence:true
  validates :postal_code,presence:true
  
  def address_name_display
    "〒" + postal_code + "　" + address + "　" + name
  end

end

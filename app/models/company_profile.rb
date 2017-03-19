class CompanyProfile < ApplicationRecord

  validates :name, presence:true
  validates :address, presence:true
  validates :vdc_mun, presence:true
  validates :ward_no, presence:true
  validates :phone_no, presence:true
  validates :vat_pan_no, presence:true
  validates :logo, presence:true
  validates :district, presence:true
  validates :zone, presence:true
  mount_uploader :logo,LogoUploader

end

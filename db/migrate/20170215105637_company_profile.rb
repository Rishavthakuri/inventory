class CompanyProfile < ActiveRecord::Migration[5.0]
  def change
    change_column :company_profiles, :phone_no, :string
  end
end

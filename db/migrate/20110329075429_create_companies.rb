class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end

class AddOriginCityToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :origin_city, :string
  end
end

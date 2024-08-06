# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Rails.logger.info "Removing existing data..."
Transaction.destroy_all
Account.destroy_all
User.destroy_all

CITIES = ["Bogotá", "León"]

users = [
  { name: "Alfonso Medina", email: "alfonso.medina@gmail.com" },
  { name: "Andrea García", email: "andrea.garcia@outlook.com" },
  { name: "Gerardo Ortiz", email: "gerardo.ortiz@university.es.com" },
  { name: "Hassan Laija", email: "hassan.laija@yahoo.com" },
  { name: "Javier Hernández", email: "javier.hernandez@hotmail.com" },
  { name: "Pedro Torres", email: "pedro.torres@gmail.com" },
  { name: "Camila Flores", email: "camila.flores@gmail.com" },
]

Rails.logger.info "Creating Users..."
users.each { |user_data| User.create!(user_data) }

Rails.logger.info "Creating Accounts..."
User.all.each do |user|
  account_type = rand(0..1).zero? ? "savings" : "current"
  account_number = "ACC-BLUE-#{rand(1000..9999)}"
  balance = rand(100000..5000000)

  account = user.accounts.create!(
    account_number: account_number,
    balance: balance,
    account_type: account_type,
    origin_city: CITIES.sample
  )

  puts "Creating Transactions for Account: #{account.account_number}..."
  rand(7..25).times do
    transaction_type = %w[deposit withdrawal].sample
    amount = rand(1000..1000000)
    location = CITIES.sample

    if transaction_type == "withdrawal" && account.balance < amount
      amount = account.balance / 2
    end

    account.transactions.create!(
      transaction_type: transaction_type,
      amount: amount,
      location: location
    )

    account.update(balance: account.balance + (transaction_type == "deposit" ? amount : -amount))
  end
end

puts "Initial Data Created Successfully."

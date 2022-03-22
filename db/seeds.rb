# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

## Destory Model Tables
AdminUser.destroy_all

Instrument.destroy_all
InstrumentType.destroy_all

## Set up CSV file to extract the data
instrumenttype_filename = Rails.root.join("db/music_data_img.csv")
puts "Loading Instrument Type the CSV file: #{instrumenttype_filename}"

instrumenttype_csv_data = File.read(instrumenttype_filename)
instrumenttypes = CSV.parse(instrumenttype_csv_data, headers:true, encoding: "utf-8")

## Loop through the CSV to populate the Model Tables
instrumenttypes.each do | it |
  instrument_types = it["Instrument_Type"].split(" / ").map(&:strip)

  instrument_types.each do | instrument_type |
    type = InstrumentType.find_or_create_by(name: instrument_type)
  end
end

## Creation Model Table Counter
puts "Created #{InstrumentType.count} Instrument Types"
puts "Created #{Instrument.count} Instruments"


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
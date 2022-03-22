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

InstrumentType.destroy_all
Instrument.destroy_all
Type.destroy_all

Province.destroy_all

## Set up CSV file to extract the data
instrument_filename = Rails.root.join("db/music_data_img.csv")
puts "Loading Instrument Type the CSV file: #{instrument_filename}"

instrument_csv_data = File.read(instrument_filename)
instruments = CSV.parse(instrument_csv_data, headers:true, encoding: "utf-8")

province_filename = Rails.root.join("db/ca_province.csv")
puts "Loading Province the CSV file: #{province_filename}"

province_csv_data = File.read(province_filename)
provinces = CSV.parse(province_csv_data, headers:true, encoding: "utf-8")


## Loop through the CSV to populate the Model Tables
instruments.each do | i |
  instrument = Instrument.create(
    name: i["Label"],
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
  )

  unless instrument.valid?
    puts "Invalid instrument #{i["Label"]}"
    next
  end

  types = i["Instrument_Type"].split(" / ").map(&:strip)

  types.each do | t |
    ## Populate our Type Model
    type = Type.find_or_create_by(name: t)

    InstrumentType.create(
      type: type,
      instrument: instrument
    )
  end
end

provinces.each do | p |
  province = Province.create(
    name: p["Name"],
    code: p["Code"]
  )

  unless province.valid?
    puts "Invalid province #{p["Name"]}"
    next
  end
end

## Creation Model Table Counter
puts "Created #{Type.count} Types"
puts "Created #{Instrument.count} Instruments"
puts "Created #{InstrumentType.count} Instrument Types"

puts "Created #{Province.count} Provinces"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
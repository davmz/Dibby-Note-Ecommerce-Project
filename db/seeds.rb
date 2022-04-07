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
Page.destroy_all

Lesson.destroy_all
Instrument.destroy_all
Type.destroy_all

User.destroy_all
Tax.destroy_all
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
  type = Type.find_or_create_by(name: i["Instrument_Type"])

  if type && type.valid?
    instrument = type.instrument.create(
      name: i["Label"],
      price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
    )

    unless instrument.valid?
      puts "Invalid Instrument #{instrument.name} for type #{type.name}"
      next
    end

    ## Insert API Image to Instrument Products
    query = URI.encode_www_form_component(instrument.name)
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    instrument.image.attach(io: downloaded_image, filename: "m-#{[instrument.name,type.name]}.jpg")

    lesson = instrument.create_lesson(
      price: Faker::Number.decimal(l_digits: 1, r_digits: 2)
    )

    unless lesson.valid?
      puts "Invalid Instrument Lesson for #{instrument.name}"
      next
    end
  end
end

provinces.each do | p |
  province = Province.create(
    name: p["Name"],
    code: p["Code"]
  )

  unless province.valid?
    puts "Invalid Province #{province.name}"
    next
  end

  tax = province.create_tax(
    pst: p["PST"],
    gst: p["GST"],
    hst: p["HST"],
    totaltax: p["Total Tax Rate"]
  )

  unless tax.valid?
    puts "Invalid Province Sales Tax for #{province.name} PST:#{tax.pst} GST:#{tax.gst} HST:#{tax.hst} Total:#{tax.totaltax}"
    next
  end
end

Page.create(
  title: "About",
  content: "Made by me, @davmz",
  permalink: "about"
)

Page.create(
  title: "Contact",
  content: "Message us for any concerns and acquiries.",
  permalink: "contact"
)

Page.create(
  title: "FAQ",
  content: "How DibbyNote was made: Ruby on Rails.",
  permalink: "faq"
)

# User.create(
#   first: "Test",
#   last: "User",
#   fullname: "Test User",
#   email: "usertest@gmail.com",
#   password: "password",
#   password_confirmation: "password"
# )

## Creation Model Table Counter
puts "Created #{Type.count} Types"
puts "Created #{Instrument.count} Instruments"
puts "Created #{Lesson.count} Lessons"

puts "Created #{Province.count} Provinces"
puts "Created #{Tax.count} Sales Tax"
puts "Created #{Page.count} Pages"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
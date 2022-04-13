require "csv"

## Destory Model Tables
AdminUser.destroy_all

Lesson.destroy_all
Instrument.destroy_all
Type.destroy_all

User.destroy_all
Tax.destroy_all
Province.destroy_all

OrderStatus.destroy_all

## Set up CSV file to extract the data
instrument_filename = Rails.root.join("db/music_data_img.csv")
Rails.logger.debug "Loading Instrument Type the CSV file: #{instrument_filename}"

instrument_csv_data = File.read(instrument_filename)
instruments = CSV.parse(instrument_csv_data, headers: true, encoding: "utf-8")

province_filename = Rails.root.join("db/ca_province.csv")
Rails.logger.debug "Loading Province the CSV file: #{province_filename}"

province_csv_data = File.read(province_filename)
provinces = CSV.parse(province_csv_data, headers: true, encoding: "utf-8")

orderstatus_filename = Rails.root.join("db/order_status.csv")
Rails.logger.debug "Loading Order Status the CSV file: #{orderstatus_filename}"

orderstatus_csv_data = File.read(orderstatus_filename)
orderstatus = CSV.parse(orderstatus_csv_data, headers: true, encoding: "utf-8")

## Loop through the CSV to populate the Model Tables
instruments.each do |i|
  type = Type.find_or_create_by(name: i["Instrument_Type"])

  next unless type&.valid?

  instrument = type.instrument.create(
    name:  i["Label"],
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
  )

  unless instrument.valid?
    Rails.logger.debug "Invalid Instrument #{instrument.name} for type #{type.name}"
    next
  end

  ## Add Images saved on file to each specific instrument
  instrument.image.attach(io: File.open(Rails.root.join("db/#{i["Image_File"]}")), filename: "m-#{[instrument.name,type.name]}.jpg")
  # instrument.image.attach(io: File.open(Rails.root.join("db/#{i["Image_File"]}")), filename: "m-#{[instrument.name,type.name]}.jpg")

  lesson = instrument.create_lesson(
    price: Faker::Number.decimal(l_digits: 1, r_digits: 2)
  )

  unless lesson.valid?
    Rails.logger.debug "Invalid Instrument Lesson for #{instrument.name}"
    next
  end
end

provinces.each do |p|
  province = Province.create(
    name: p["Name"],
    code: p["Code"]
  )

  unless province.valid?
    Rails.logger.debug "Invalid Province #{province.name}"
    next
  end

  tax = province.create_tax(
    pst:      p["PST"],
    gst:      p["GST"],
    hst:      p["HST"],
    totaltax: p["Total Tax Rate"]
  )

  unless tax.valid?
    Rails.logger.debug "Invalid Province Sales Tax for #{province.name}"
    next
  end
end

orderstatus.each do |stat|
  orderstat = OrderStatus.create(
    status: stat["Status Name"]
  )

  unless orderstat.valid?
    Rails.logger.debug "Invalid Order #{orderstat.name} Status"
    next
  end
end

## Creation Model Table Counter
Rails.logger.debug "Created #{Type.count} Types"
Rails.logger.debug "Created #{Instrument.count} Instruments"
Rails.logger.debug "Created #{Lesson.count} Lessons"

Rails.logger.debug "Created #{Province.count} Provinces"
Rails.logger.debug "Created #{Tax.count} Sales Tax"
Rails.logger.debug "Created #{OrderStatus.count} Order Status'"

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

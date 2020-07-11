load "HashesManager.rb"
load "DatesManager.rb"

datesManager = DatesManager.new(beginning_date: Time.now, unit: :days, duration: 10)
p datesManager.dates_processor[:days].call

hashesManager = HashesManager.new

fruits_country = {
'orange' => 'Marocco',
'banana' => 'Ecuador',
'lemon' => 'Marocco',
}
p hashesManager.safe_invert(fruits_country)

data = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon']
p hashesManager.to_histogram(data)

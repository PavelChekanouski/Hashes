load "Hashes.rb"

hashes = Hashes.new

fruits_country = {
'orange' => 'Marocco',
'banana' => 'Ecuador',
'lemon' => 'Marocco',
}
p hashes.task2(fruits_country)

data = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon']
p hashes.task3(data)
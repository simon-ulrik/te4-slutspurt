# frozen_string_literal: true

require 'sequel'

db = Sequel.connect('postgres://security:qwerty@0.0.0.0:5432/simons_super_secure_db')

fruits_table = db[:fruits]
fruits = [
  { name: 'Banana', description: '', rating: rand(0..5) },
  { name: 'Apple', description: '', rating: rand(0..5) },
  { name: 'Pear', description: '', rating: rand(0..5) },
  { name: 'Citron', description: '', rating: rand(0..5) },
  { name: 'Drakfrukt', description: '', rating: rand(0..5) }
]

fruits.each do |fruit|
  fruits_table.insert(name: fruit[:name], description: fruit[:description], rating: fruit[:rating])
end

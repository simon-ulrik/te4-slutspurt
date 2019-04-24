# frozen_string_literal: true

require 'sequel'

db = Sequel.connect('postgres://security:qwerty@0.0.0.0:5432/simons_super_secure_db')

db.tables.each do |table|
  db.drop_table(table)
end

db.create_table :fruits do
  primary_key :id
  String :name, unique: true, null: false
  String :description
  Float :rating, null: false
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 2 bins
Bin.create([{ slug: 'puppi123 ' }, { slug: 'andi321' }])

# Create a request linked to the first bin
Request.create(payload: '{"headers": {"header 1": "a", "header 2": "b"}, "body": "{"I am a happy response body"}"}', bin_id: 1)

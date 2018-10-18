require("pry-byebug")
require_relative("models/casting")
require_relative("models/movie")
require_relative("models/star")

Movie.delete_all
Star.delete_all
Casting.delete_all

movie_eternal = Movie.new({
    'title' => 'Eternal Sunshine of the Spotless Mind',
    'genre' => 'Sci-fi'
  })

movie_shawshank = Movie.new({
    'title' => 'Shawshank Redemption',
    'genre' => 'Drama'
  })

movie_mask = Movie.new({
    'title' => 'The Mask',
    'genre' => 'Comedy'
  })

movie_eternal.save
movie_shawshank.save
movie_mask.save

star_carrey = Star.new({
  'first_name' => 'Jim',
  'last_name' => 'Carrey'
  })

star_winslet = Star.new({
  'first_name' => 'Kate',
  'last_name' => 'Winslet'
  })

star_freeman = Star.new({
  'first_name' => 'Morgan',
  'last_name' => 'Freeman'
  })

star_carrey.save
star_winslet.save
star_freeman.save

casting1 = Casting.new({
  'movie_id' => movie_eternal.id,
  'star_id' => star_carrey.id,
  'fee' => 1000000
  })

casting2 = Casting.new({
  'movie_id' => movie_eternal.id,
  'star_id' => star_winslet.id,
  'fee' => 500000
  })

casting3 = Casting.new({
  'movie_id' => movie_shawshank.id,
  'star_id' => star_freeman.id,
  'fee' => 2000000
  })

casting4 = Casting.new({
  'movie_id' => movie_mask.id,
  'star_id' => star_carrey.id,
  'fee' => 3000000
  })

casting1.save
casting2.save
casting3.save
casting4.save

binding.pry
nil

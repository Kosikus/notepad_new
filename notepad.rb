# encoding: UTF-8
# XXX/ Этот код необходим только при использовании русских букв на Windows
# if (Gem.win_platform?)
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__

#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end
# /XXX

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require "date"
require_relative "post"
require_relative "memo"
require_relative "link"
require_relative "task"

puts "Привет, я твой блокнот!"
puts "Что хотите записать в блокнот?"
puts __ENCODING__

choices = Post.post_types

user_choice = -1

until (0...choices.size).include?(user_choice)
  choices.each_with_index { |choice, index| puts "#{index}. #{choice}" }

  user_choice = STDIN.gets.to_i
end

entry = Post.create_post(user_choice)
entry.read_from_console
entry.save

puts "Ура, запись сохранена!"


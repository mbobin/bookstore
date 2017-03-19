class Book < Sequel::Model
  many_to_one :author
  one_to_many :versions
end

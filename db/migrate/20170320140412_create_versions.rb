Sequel.migration do
  change do
    create_table :versions do
      primary_key :id
      foreign_key :book_id, :books, index: true
      String :isbn
      Text :path
      String :sha_hash, index: { unique: true }
    end
  end
end

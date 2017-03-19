Sequel.migration do
  change do
    create_table :books do
      primary_key :id
      foreign_key :author_id, :authors, index: true
      String :name
      String :publisher
    end
  end
end

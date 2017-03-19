Sequel.migration do
  change do
    create_table :authors do
      primary_key :id
      String :name
    end
  end
end

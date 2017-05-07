Sequel.migration do
  change do
    create_table(:authors) do
      primary_key :id
      column :name, "text"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:books) do
      primary_key :id
      foreign_key :author_id, :authors, :key=>[:id]
      column :name, "text"
      column :publisher, "text"
      
      index [:author_id]
    end
    
    create_table(:versions) do
      primary_key :id
      foreign_key :book_id, :books, :key=>[:id]
      column :isbn, "text"
      column :path, "text"
      column :sha_hash, "text"
      
      index [:book_id]
      index [:sha_hash], :unique=>true
    end
  end
end
              Sequel.migration do
                change do
                  self << "SET search_path TO \"$user\", public"
                  self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20170320134716_create_authors.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20170320135234_create_books.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20170320140412_create_versions.rb')"
                end
              end

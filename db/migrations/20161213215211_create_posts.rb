Sequel.migration do
  change do
    create_table(:posts) do
      primary_key :id
      String  :title,  null: false, text: true
      String  :body,   null: false, text: true
    end
  end
end
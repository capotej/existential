ActiveRecord::Schema.define(:version => 0) do
  create_table :users, :force => true do |t|
    t.string :name
  end

  create_table :posts, :force => true do |t|
    t.string :name
    t.string :user_id
  end



end

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :chatroom
      t.belongs_to :user
      t.string :body

      t.timestamps
    end
  end
end

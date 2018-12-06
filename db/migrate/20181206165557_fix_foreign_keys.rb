class FixForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :user_stocks, :stocks
    remove_foreign_key :user_stocks, :users
    add_foreign_key :user_stocks, :users, on_delete: :cascade
    add_foreign_key :user_stocks, :stocks, on_delete: :cascade
  end
end

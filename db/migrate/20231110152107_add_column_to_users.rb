class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    # データベース側にも一意性を持たせる
    add_index :users, :name, unique: true
  end
end

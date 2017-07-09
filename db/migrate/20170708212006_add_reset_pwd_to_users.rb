class AddResetPwdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :question, :int
    add_column :users, :answer, :string
  end
end

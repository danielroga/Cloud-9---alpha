class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string  #MUST be called 'password digest' to work
  end
end

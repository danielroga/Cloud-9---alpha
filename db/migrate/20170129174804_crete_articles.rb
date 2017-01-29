class CreteArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
    end
  end
end

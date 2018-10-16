class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :short_url
  end
end

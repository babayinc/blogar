class AddPosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.text :content
  		t.text :username
  		t.timestamps
  	end
  end
end

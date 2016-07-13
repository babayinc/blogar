class AddComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.belongs_to :post, index: true
  		t.text :content
  		t.text :username
  		t.timestamps
  	end
  end
end

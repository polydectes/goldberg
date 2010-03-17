class CreateComments < ActiveRecord::Migration
  def self.up
    create_table  :comments do |t|
      t.text      :text
      t.string    :email
      t.string    :name
      t.integer   :content_page_id
      t.integer   :site_controller_id
      t.string    :kind
      t.integer   :user_id
      t.integer   :reference_comment_id
      t.timestamp :created_at
      t.string    :website
      t.integer   :permission_id, :default => 0, :null => false
 
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

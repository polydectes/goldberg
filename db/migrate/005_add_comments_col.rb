class AddCommentsCol < ActiveRecord::Migration
  include Goldberg::Migration


  def self.up
    add_column "#{prefix}content_pages", "arecomments", :integer, :default => 0
  end

  def self.down
    remove_column "#{prefix}content_pages", "arecomments"
  end
end

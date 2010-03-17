class RenameComments < ActiveRecord::Migration
  include Goldberg::Migration
  def self.up

    rename_table :comments, "#{prefix}commments"

  end

  def self.down

    rename_table "#{prefix}comments", :comments

  end
end

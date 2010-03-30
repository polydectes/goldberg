class FixCommentsAddTimestamps < ActiveRecord::Migration
  include Goldberg::Migration
  def self.up

    add_column "#{prefix}roles_permissions", :created_at, :datetime
    add_column "#{prefix}roles_permissions", :updated_at, :datetime

  end

  def self.down

    remove_column "#{prefix}roles_permissions", :created_at
    remove_column "#{prefix}roles_permissions", :updated_at

  end

end

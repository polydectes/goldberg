class FixCommentsAddTimestamps < ActiveRecord::Migration
  include Goldberg::Migration
  def self.up

    rename_table "#{prefix}commments", "#{prefix}comments"

    add_column "#{prefix}controller_actions", :created_at, :datetime
    add_column "#{prefix}controller_actions", :updated_at, :datetime

    add_column "#{prefix}menu_items", :created_at, :datetime
    add_column "#{prefix}menu_items", :updated_at, :datetime

    add_column "#{prefix}permissions", :created_at, :datetime
    add_column "#{prefix}permissions", :updated_at, :datetime

    add_column "#{prefix}site_controllers", :created_at, :datetime
    add_column "#{prefix}site_controllers", :updated_at, :datetime

    add_column "#{prefix}system_settings", :created_at, :datetime
    add_column "#{prefix}system_settings", :updated_at, :datetime

    add_column "#{prefix}users", :created_at, :datetime
    add_column "#{prefix}users", :updated_at, :datetime

    add_column "#{prefix}roles_permissions", :created_at, :datetime
    add_column "#{prefix}roles_permissions", :updated_at, :datetime
  end

  def self.down

    rename_table "#{prefix}comments", "#{prefix}commments"

    remove_column "#{prefix}controller_actions", :created_at
    remove_column "#{prefix}controller_actions", :updated_at

    remove_column "#{prefix}menu_items", :created_at
    remove_column "#{prefix}menu_items", :updated_at

    remove_column "#{prefix}permissions", :created_at
    remove_column "#{prefix}permissions", :updated_at

    remove_column "#{prefix}site_controllers", :created_at
    remove_column "#{prefix}site_controllers", :updated_at

    remove_column "#{prefix}system_settings", :created_at
    remove_column "#{prefix}system_settings", :updated_at

    remove_column "#{prefix}users", :created_at
    remove_column "#{prefix}users", :updated_at

  end

end

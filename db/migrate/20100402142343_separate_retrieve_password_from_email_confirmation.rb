class SeparateRetrievePasswordFromEmailConfirmation < ActiveRecord::Migration
  include Goldberg::Migration
  def self.up

    add_column "#{prefix}system_settings", :allow_password_retrieval, :boolean, :default => true

  end

  def self.down

    remove_column "#{prefix}system_settings", :allow_password_retrieval

  end

end

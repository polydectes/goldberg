module Goldberg
  class Comment < ActiveRecord::Base
    include Goldberg::Model
    belongs_to :content_page , :class_name => 'Goldberg::ContentPage'
  end
end

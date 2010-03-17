module Goldberg
class Comment < ActiveRecord::Base
belongs_to :content_page , :class_name => 'Goldberg::ContentPage'  
end
end

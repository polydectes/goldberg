module Goldberg
  # Goldberg::Helper will be added as a helper to ActionController::Base,
  # so its methods will be available in the views throughout all
  # controllers (just as if they'd been added to ApplicationHelper).
  module Helper

    # Renders the title of the page: either the ContentPage.name or the
    # current controller and action.
    def goldberg_title
      if params[:controller] == 'goldberg/content_pages' and
          ( params[:action] == 'view' or 
            params[:action] == 'view_default')
        "#{@content_page.title}"
      else
        "#{params[:controller]} | #{params[:action]}" 
      end
    end

    # Renders a top (i.e. one level deep) static menu.
    def goldberg_main_menu
      render :file => "#{RAILS_ROOT}/vendor/plugins/goldberg/app/views/goldberg/menu_items/_menubar.rhtml", :use_full_path => false, :locals => {:level => 0, :depth => 0, :class_attr => nil}
    end

    # Renders a nested side menu, for all levels below the main menu.
    def goldberg_left_menu
      render :file => "#{RAILS_ROOT}/vendor/plugins/goldberg/app/views/goldberg/menu_items/_menubar.rhtml", :use_full_path => false,  
      :locals => {:level => 1, :depth => (Goldberg.settings.menu_depth - 2),
        :class_attr => 'sidemenu'}
    end

    # Renders an entire multilevel suckerfish menu.  Whether this is to
    # be rendered along the top, left hand or right hand side of the
    # page depends on the page's stylesheet.  This code just returns the
    # menu structure.
    def goldberg_suckerfish_menu
    

      render :file => "#{RAILS_ROOT}/vendor/plugins/goldberg/app/views/goldberg/menu_items/_suckerfish.rhtml", :use_full_path => false, :locals => {:items => Goldberg.menu.get_menu(0)}
    end

    def mega_menu
    ###get the whole thing
      render :file => "#{RAILS_ROOT}/vendor/plugins/goldberg/app/views/goldberg/mega_menu/_mega_menu.rhtml", :use_full_path => false, :locals => {:items => Goldberg.menu.get_menu(0)}
      #render :text => "OK Right"
    end


    # Renders the breadcrumbs (i.e. representing the user's current
    # position in the menu hierarchy).
    def goldberg_breadcrumbs
      render :file => "#{RAILS_ROOT}/vendor/plugins/goldberg/app/views/goldberg/menu_items/_breadcrumbs.rhtml", :use_full_path => false, :locals => {:crumbs => Goldberg.menu.crumbs}
    end

    # Renders the login prompt.  This changes depending on whether a
    # user is logged in or not.  If a user is logged in, a mini-form is
    # presented with a button to log out.  If not, a link to the
    # auth/login page is presented.
    def goldberg_login
      render :file => "#{RAILS_ROOT}/vendor/plugins/goldberg/app/views/goldberg/auth/_login.rhtml", :use_full_path => false
    end
   
    
   #return the current MenuItem
    def get_Menu_Item
        item_name = session[:goldberg][:menu_item]
   end

  #returns the main menu name  
   def main_Menu_Name
        Goldberg.menu.main_Menu_Name
   end
   
  #checks wether a user defined css-file exists 
   def own_css_exist?
    path="#{RAILS_ROOT}/public/stylesheets/#{main_Menu_Name}/all.css"
    if FileTest.exists?(path)
      return  true
    else
     return false
    end
   end
  
  end  
end


def side_bar_file
   path1="#{RAILS_ROOT}/public/html/#{main_Menu_Name}/sidebar.xhtml"
   path2="#{RAILS_ROOT}/public/html/#{main_Menu_Name}/sidebar.html"
    #defaultvalue
   path3="#{RAILS_ROOT}/public/goldberg/html/sidebar.xhtml"
     result_string = FileTest.exists?(path1) ? path1 : path2
       ###last defaultvalue if all the others are nil

     result_string = FileTest.exists?(result_string) ? result_string : path3
  return result_string
end



# You'd think this would work, but it only works on the first request
# after a server restart because helpers get reloaded on each request:
# ApplicationHelper.module_eval do
#  include Goldberg::Helper
# end

# This works:
ActionController::Base.class_eval do
  helper Goldberg::Helper
end

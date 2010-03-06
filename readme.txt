
Sidebar 2010/03/06

Adding sidecontent - html files (only available with theme blue_snooker)
under the login link there is a lot of whitespace. This space is used now.
Edit the file public/goldberg/html/sidebar.xhtml to your own needs or delete it.

The functionality with different skins according to the mainmenue - introduced with 960gs - still exists and is
expanded to different use of witespace according to your main-menu-names.

create a directory : public/html/<main-menu-name>
add there a file sidebar.html or xhtml

This is displayed when used subpages under a mainmenu.




Adding mega-menus  (only available with theme blue_snooker)  2010/03/04


Megamenus are menus with a fixed depth of hirarchy. In our case the maximum is 3.
You can see the main menu + the first topic + the 3 level as mouseover functionality.
To switch this functionality on or off go to Your config/environment.rb of Your
ruby project and add

 $mega_menu = true





Adding blueprint-css 2010/02/28

Install :

rake goldberg:theme[blue_snooker]

You can use blueprint-css instead of 960gs
works with rails 2.3.5 (changed rake syntax)
with blueprint-css 960gs is not supported anymore from me



own theme for every main menu entry.

You can create for every main menu entry a own theme.
A main menu entry is the menu directly under the root node of menu.

Howto :

1. Install 960gs_snooker theme
2. copy the files frome the directory public/goldberg/stylesheets to 
   public/stylesheets/<nameOftheMenu>

NameOftheMenu is the field "name" of the menuItem (you find it for example :
http://localhost:3000/goldberg/menu_items/edit/1

3. Modify the css - files to Your own need

4. Don't delete or rename all.css this file is the entrypoint and called from the system



Comments

For every contentpage a comment-section  is introduced.
Comments on a contentpage are displayed and can be added.




960gs_snooker (can be used but not under development any more)

On the basis of the existing snooker design 960gs is introduced.

Inspired of the book "transcending css" the existing snooker-design was modified and splitted in three sections :

1. color.css
2. layout.css
3. typo.css

This three ccs files are called in all.css 


In that way it is easier to adopt the design to your own CI.

Second a grid system was implemented.
I struggled with a lot of gridsystems with the result that I use 960gs.
In my opinion at the moment the most efficient grid-system which is easy (for me very important)
Go to www.960gs an learn how to use it. There are a few classes you have to know.

When You log in as admin : You see a small botton "grid on".

How to change the grid 16 to grid 12 ?

Goto file views/layouts/application.html.erb change there : 	jQuery("body").addGrid(16, {img_path: '/goldberg/images/'});

to 	jQuery("body").addGrid(12, {img_path: '/goldberg/images/'});

Many thanks to Nathan Smith (http://960.gs) 
and 
badlyDrawnToy http://www.badlydrawntoy.com

to install goldberg with that schema

                      rake goldberg:theme 960gs_snooker

You are asked to overwrite goldberg.css  type yes.















Adding blueprint-css

Istall :

rake goldberg:theme[blue_snooker]

Now You can use blueprint-css instead of 960gs
Now works with rails 2.3.5 (changed rake syntax)




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

960gs_snooker

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















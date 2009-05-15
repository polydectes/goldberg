module Goldberg
  module ContentPagesHelper
    def fckeditor_text_area(replace_id)
    return <<-END
#{ javascript_include_tag '/fckeditor/fckeditor.js' }
<script type="text/javascript">
window.onload = function() 
{
  var oFCKeditor = new FCKeditor('#{ replace_id }') ;
  oFCKeditor.Width = '100%' ;
  oFCKeditor.Height = 400 ;
  oFCKeditor.Config['LinkBrowserURL'] = '/fckeditor/editor/filemanager/browser/default/browser.html?Connector=/goldberg/content_pages/fck_filemanager' ;
  oFCKeditor.Config['ImageBrowserURL'] = '/fckeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=/goldberg/content_pages/fck_filemanager' ;
  oFCKeditor.Config['FlashBrowserURL'] = '/fckeditor/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=/goldberg/content_pages/fck_filemanager' ;
  oFCKeditor.Config['SpellChecker'] = 'SpellerPages' ;
  oFCKeditor.Config['SpellerPagesServerScript'] = '/goldberg/content_pages/fck_speller_pages' ;
  oFCKeditor.ReplaceTextarea() ;
}
</script>
END
    end

  def dispCommentBlock
    if(@content_page.arecomments == 1) then
      #@comments = Comment.find(:all)
      @comments = Comment.find(:all, :conditions => ["content_page_id =? AND kind = ?", @content_page.id,"content"],:order => ["created_at desc"])  
      @comment = Goldberg::Comment.new
      if Goldberg::user != nil then 
      @comment.name  = Goldberg::user.fullname 
      @comment.email = Goldberg::user.email 
      end
      @comment.content_page_id = @content_page.id
      render :partial => "goldberg/comments/displayComments"    
    end
    end

   end
end

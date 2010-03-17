module Goldberg
  module ContentPagesHelper
    def fckeditor_text_area(replace_id)
    return <<-END
#{ javascript_include_tag '/ckeditor/ckeditor.js' }
<script type="text/javascript">
window.onload = function() 
{
  CKEDITOR.replace('#{ replace_id }') ;
  CKEDITOR.config.width = '90%' ;
}
</script>
END
    end

  def dispCommentBlock
    if(@content_page.arecomments == 1) then
      @comments = Goldberg::Comment.find(:all, :conditions => ["content_page_id =? AND kind = ?", @content_page.id,"content"],:order => ["created_at desc"])
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

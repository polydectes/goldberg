module Goldberg
class CommentsController < ApplicationController
 include Goldberg::Controller

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:goldberg_comment])
       respond_to do |format|
       @comment.kind = "content"
         if @comment.save
             @comments = Comment.find(:all, :conditions => ["content_page_id =? AND kind = ?", @comment.content_page_id,"content"],:order => ["created_at desc"])  
         flash[:notice] = 'Comment was successfully created.'
         format.html 
         format.xml  { render :xml => @comment, :status => :created, :location => @comment }
         format.js
         @comment = Comment.new
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end


end
end

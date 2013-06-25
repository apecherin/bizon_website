class SearchController < ApplicationController

  def addIndex
    Blog.index.delete
    Blog.create_elasticsearch_index
    Blog.index.import Blog.all
    redirect_to root_path
  end

  def autoComplete
    #@artists = Artist.tire.search("name.autocomplete:#{params[:query]}").collect{|res| {:label => res.name, :category => "Artists", :id => res.id}}
    #@blogs = Blog.tire.search("post.autocomplete:#{params[:query]}").collect{|res| res.title}
    @blogs = Blog.tire.search("post.autocomplete:#{params[:query]}").collect{|res| {:label => res.title, :id => res.id}}

    respond_to do |format|
      format.json { render json: @blogs }
    end
  end

end

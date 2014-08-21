class PostsController < ApplicationController

def index
	@posts= Post.all
end

def new
	render : new
end

def create
	new_post = params[:post].permit(:name, :description, :author)
	new_tag = params[:tag].permit(:name)
	Post.create(new_post).tags << Tag.find_or_create_by(name: new_tag[:name])
	redirect_to '/posts'
end

def show
	id = params[:id]
	@post= Post.find_by_id(id)
	render :show
end



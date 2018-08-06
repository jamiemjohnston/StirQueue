 class PostsController < ApplicationController

 	
	before_action :authenticate_user!, except: [:index, :show]
	after_action :allow_iframe

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = current_user.posts.build
	end

	def create
		#render plain: params[:post].inspect
		@post = current_user.posts.build(post_params)


		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def delete_all

		@posts = Post.all
		
		@posts.each do |post|

			post = Post.find(params[:id])
			post.destroy

		end

		redirect_to posts_path

	end

	def allow_iframe
          response.headers.except! 'X-Frame-Options'
    end

end

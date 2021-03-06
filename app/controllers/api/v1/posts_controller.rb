class Api::V1::PostsController < ApplicationController
  include ProtectRoutesConcern
  
  def index
    posts = []
    Post.all.each do |post|
      posts.push({
        id: post.id,
        title: post.title, 
        description: post.description,
        body: post.body,
        large_image: url_for(post.large_image),
        middle_image: url_for(post.middle_image),
        thumb_image: url_for(post.thumb_image)
      })
    end
    render json: posts, status: 200
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: {
        id: post.id,
        title: post.title, 
        description: post.description, 
        body: post.body, 
        large_image: url_for(post.large_image),
        middle_image: url_for(post.middle_image),
        thumb_image: url_for(post.thumb_image)
      }, status: 201
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  def update
    post = Post.find(params[:id])
    unless post.title.eql? params[:title] then post.title = params[:title] end 
    unless post.description.eql? params[:description] then post.description = params[:description] end
    unless post.body.eql? params[:body] then post.body = params[:body] end
    unless params[:image].is_a?(Object) then post.image = params[:image] end 
    if post.save
      render json: {
        id: post.id,
        title: post.title,
        description: post.description,
        body: post.body,
        large_image: url_for(post.large_image),
        middle_image: url_for(post.middle_image),
        thumb_image: url_for(post.thumb_image)
      }, status: 200
    else 
      render json: {}, status: 422 
    end
  end

  def destroy
    if Post.find(params[:id]).destroy then render json: {}, status: 200 end
  end

  private

  def post_params
    params.permit(:title, :description, :body, :image)
  end
end
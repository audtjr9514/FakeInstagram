class PostsController < ApplicationController
  def index
    if user_signed_in?
      @dbs = Db.all.reverse
    end
    
    @dbs = Db.all.reverse
  end

  def create
    @db = Db.new
    @db.title = params[:title]
    @db.content = params[:content]
    @db.user_id = current_user.id
    
    uploader = ImageUploader.new
    uploader.store!(params[:img])
    @db.img_url = uploader.url
    
    hashtags = params[:hashtags].split(',')
    hashtags.each do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.delete('#'))
      hashtag.save
      @db.hashtags << hashtag
    end
    
    @db.save
    
    redirect_to '/posts/index'
  end

  def delete
    db = Db.find(params[:db_id])
    db.destroy
    
    redirect_to '/posts/index'
  end
  
  def edit
    @db = Db.find(params[:db_id])
  end
  
  def update
    @db = Db.find(params[:db_id])
    @db.title = params[:title]
    @db.content = params[:content]
    @db.hashtags.clear
    hashtags = params[:hashtags].split(',')
    hashtags.each do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.delete('#'))
      hashtag.save
      @db.hashtags << hashtag
    end
    @db.save
    
    redirect_to '/posts/index'
  end
end
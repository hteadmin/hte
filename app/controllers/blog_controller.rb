class BlogController < ApplicationController

  set_tab :blog

  def index
    @articles = Blog::Article.page(params[:page]).per(10).order('created_at DESC')
  end

  def article
    @article = Blog::Article.find_by_slug(params[:slug])
  end

  def category
    @category = Blog::Category.find_by_slug(params[:slug])
  end

  def archive
    @year = params[:year]
    @month = params[:month]
    @articles = Blog::Article.order('created_at DESC').where("MONTH(created_at) = ? and YEAR(created_at) = ?", @month, @year)
  end

end
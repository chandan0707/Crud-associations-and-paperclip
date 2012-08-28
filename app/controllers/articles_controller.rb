class ArticlesController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]

	def index
		@articles= Article.all
	end
	def show
@article = Article.find(params[:id])
@comment = Comment.new
@comment.article_id = @article.id
  end
	def new
		@article= Article.new

	end

def create
	   @article = Article.new(params[:article])
	   if  @article.save
     	redirect_to article_path(@article), :notice=>"Your post was saved"
	else
		render "new"
	end
    #@article.save
    #redirect_to article_path(@article)


end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
flash[:message] = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

def destroy
	@article=Article.find(params[:id])
		if @article.delete
			flash[:message]="Hurrey! your comment is deleted"
		redirect_to :action=>'index'
	else
		render 'index'
	end
end
def about_us
	end
	def contact_us
	end
	def blogger_information
	end
def me_us
end
end

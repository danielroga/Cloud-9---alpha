class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @article_list = Article.paginate(page: params[:page], per_page: 4)
    end
    
    
    def new
        @article = Article.new
    end
    
    def create
        #debugger
        #render plain: params[:article].inspect     #test
        @article = Article.new(article_params)
        #harcode user for testing
        @article.user = User.first
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render :new
        end
    end
  
    def edit
    end
  
    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end  
    
    def show
    end
    
    def destroy
        @article.destroy
        flash[:danger] = "Articles was successfully deleted"
        redirect_to articles_path
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
        
        def set_article
            @article = Article.find(params[:id])
        end
end
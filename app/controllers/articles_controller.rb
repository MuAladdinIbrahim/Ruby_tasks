class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "muhammad", password: "muhammad", except: [:index, :show]

    load_and_authorize_resource #:only => [:index, :edit, :update, :destroy]
    skip_authorize_resource :only => [:show, :new,:index]


    def index
        @articles = Article.all
      end
    def show
        @article = Article.find(params[:id])
        # authorize! :read, @article

    end

    def new 
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
      # authorize! :edit, @article

    end

    def update
      @article = Article.find(params[:id])
     
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
      # authorize! :update, @article

    end

    def create
      # render plain: params[:article].inspect ##used in debugging 
      @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
      # authorize! :create, @article
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
        # authorize! :destroy, @article
      end
    
    private
        def article_params
             params.require(:article).permit(:title, :text)
        end
end

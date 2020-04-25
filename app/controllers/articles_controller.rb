class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "muhammad", password: "muhammad", except: [:index, :show]
    def index
        @articles = Article.all
      end
    def show
        @article = Article.find(params[:id])
      end
    def new 
    end
    def create
        # render plain: params[:article].inspect ##used in debugging 
        @article = Article.new(article_params)
        @article.save
        redirect_to @article

    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    private
        def article_params
             params.require(:article).permit(:title, :text)
        end
end

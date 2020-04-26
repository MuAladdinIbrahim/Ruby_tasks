class CommentsController < ApplicationController
    http_basic_authenticate_with name: "muhammad", password: "muhammad", only: :destroy

    def create
      if can? :crud, Comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
     else
        authorize! :crud, @comment
     end
    end
   
    def destroy
      if can? :crud, Comment
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    else
      authorize! :crud, @comment
   end
    end
   
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
  end
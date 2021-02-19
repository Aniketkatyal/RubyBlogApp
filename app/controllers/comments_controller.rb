
        class CommentsController < ApplicationController
            include LoggedUserConcern
            def create
                @article = Article.find(params[:article_id])
                @comment = @article.comments.create(comment_params)
                render json: {status: 'SUCCESS', message: 'Comment Added', data:@comment},status: :ok
            end
            
              private
                def comment_params
                  params.require(:comment).permit(:commenter, :body)
                end
            end
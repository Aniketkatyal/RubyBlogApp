class ArticlesController < ApplicationController
            
                include LoggedUserConcern

                def index
                    if @current_user
                        @articles = Article.all
                        render json: {status: 'SUCCESS', message: 'Loaded blogs', data:@articles},status: :ok
                    end
                end


            def show
                @article = Article.find(params[:id])
                    render json: {status: 'SUCCESS', message: 'Loaded blog', data:@article},status: :ok
            end

            def create
                @article = Article.new(article_params)
                if @article.save 
                    render json: {status: 'SUCCESS', message: 'Saved blog', data:@article},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Blog not Saved', data:@article.errors},status: :unprocessable_entity
                end
            end

            def destroy
                @article = Article.find(params[:id])
                @article.comments.destroy
                @article.destroy
                render json: {status: 'SUCCESS', message: 'Deleted blog', data:@article},status: :ok
            end

            def update
                @article = Article.find(params[:id])
                if @current_user && @article.update(article_params)
                    render json: {status: 'SUCCESS', message: 'Updated blog', data:@article},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Blog not Updated', data:@article.errors},status: :unprocessable_entity
                end
            end

            private
            def article_params
                params.require(:article).permit(:title,:body, :file)
            end
        end
        

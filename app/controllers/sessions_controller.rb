
        class SessionsController < ApplicationController
            include CurrentUserConcern
            
            def create
                @user = User.find_by(username: params["user"]["username"])
                .try(:authenticate , params["user"]["password"])
                print @user
                if @user
                    session[:user_id] = @user.id
                    render json: {status: 'SUCCESS', message: 'User logged In', data: @user}
                else
                    render json: {status: 'ERROR', message: 'Invalid User', data: @user}
                end
            end

            def logged_in
                if @current_user
                    render json: {
                        logged_in: true,
                        user: @current_user
                    }
                else
                    render json: {
                        logged_in: false,
                    }
                end
            end
            def logout
                reset_session
                render json: {
                    status: 200, logout: true
                }
            end
        end
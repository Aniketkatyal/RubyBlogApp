
        class RegistrationsController < ApplicationController
            def create
                user = User.create!(
                    username: params["user"]["username"],
                    password: params["user"]["password"],
                    password_confirmation: params["user"]["password_confirmation"]
                )
                print user
                if user
                    session[:user_id] = user.id
                    render json: {status: 'SUCCESS', message: 'User Created', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Some error occured', data: user}, status: :ok
                end
            end
        end


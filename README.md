# Right Foot

An app app to help you start your day off on the right foot. 

# Table Of Contents 
- [Description](https://github.com/KelsCree/morning-peace-fe#description)
- [How It Works](https://github.com/KelsCree/morning-peace-fe#how-it-works)
- [Example Code](https://github.com/KelsCree/morning-peace-fe#example-code)
- [Technology Used](https://github.com/KelsCree/morning-peace-fe#technology-used)
- [Setting up for the Application](https://github.com/KelsCree/morning-peace-fe#setting-up-for-the-application)
- [Main Features](https://github.com/KelsCree/morning-peace-fe#main-features)
- [Features in Progress](https://github.com/KelsCree/morning-peace-fe#features-in-progress)
- [Contact Information](https://github.com/KelsCree/morning-peace-fe#contact-information)
- [Link to Backend Repo](https://github.com/KelsCree/morning-peace-fe#link-to-backend-repo)

## Description

Right Foot is an application that allows users to intentially practice and track both gratitude journaling and meditation. The app keeps track of each journal entry and completed meditation logged by the user, displays their progress, and serves as an uplifting reminder for the user to revist as needed. 

## How It Works

[Right Foot](youtubelink)

## Example Code 
```
class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:create, :login]

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      @token = JWT.encode({ user_id: @user.id }, Rails.application.secrets.secret_key_base[0])
      render json: { token: @token, user: @user }, status: :ok
    else
      render json: { message: 'Invalid username or password - try again!' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :firstname,
      :password
    )
  end

```
```
  class ApplicationController < ActionController::API

  before_action :authenticate

  def authenticate
    auth_header = request.headers['Authorization']
    if !auth_header
      render json: { message: 'Not authorized to view this content' }, status: :forbidden
    else
      token = auth_header.split(' ')[1]
      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base[0])
        payload = decoded_token.first
        user_id = payload['user_id']
        @user = User.find(user_id)
      rescue
        render json: { message: 'Invalid JWT' }, status: :forbidden
      end
    end
  end
end

```

## Technology Used

- Ruby on Rails
- SQLite
- Bcrypt


## Setting up for the application

To begin first run 
    
```
    rails db:migrate
``` 

and

```
    rails db:seed
```
    
then 
    
```
    rails s
```

To log in as an existing user with pre-populated entries, use:
username: kcree
password: apple

## Main Features

- Ruby on Rails backend featuring two 1:M relationships to track users, as well as their associated jounral entries and meditations
- Fully implemented auth using bcrypt and tokens to restrict access to active users and error messages that populate on the frontend.

## Features in Progress

- Plans to add another item to the homepage that automatically increments new meditation 'streak' goals for the user.
- Plans to deploy the app using firebase and heroku

## Contact Information

[Kelsey Creehan](https://www.linkedin.com/in/kelsey-creehan/)

## Link to Frontend Repo

https://github.com/KelsCree/right-foot-fe

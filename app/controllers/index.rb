# GET ========================================================================================================

get '/' do
  @posts = Post.all
  erb :index
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  @tags = @post.tags.all
  erb :post
end

get '/all_posts/:id' do
  erb :user_posts
end

get '/login' do
  erb :login
end

get '/create_post_form' do
  erb :create_post
end

get '/all_tags' do
  @tags = Tag.all
  erb :all_tags
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @tag_posts = @tag.posts.all
  erb :tag
end

get '/logout' do
  session.clear
  redirect to '/'
end

# POST =======================================================================================================

post '/post/:post_id/create_comment' do
  # Verify user
  # Verify session

  comment = Comment.create(comment_text: params[:comment_text], post_id: params[:post_id])
  redirect to "/posts/#{params[:post_id]}"
end

post '/create_post' do
  @post = Post.create(post_title: params[:post_title], post_text: params[:post_text], user_id: current_user.id)
  redirect to "/posts/#{@post.id}"
end

post '/auth_user' do
  @posts = Post.all
  user = User.find_by_email(params[:email])
  if user
    if user.authenticate(params[:password])
      session[:id] = user.id
      redirect to '/all_posts/:id'
    else
      @login_error = "Login Fail"
      erb :login
    end
  else
    @login_error = "Login Fail"
    erb :login
  end
end

post '/post/:id/destroy' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect to '/'
end

post '/create_user' do
  user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])
  if user.valid?
    if user.authenticate(params[:password_confirmation])
      user.save
      session[:id] = user.id
      redirect to '/'
    else
      @error = "Create User Fail"
      erb :login
    end
  else
    @error = "Create User Fail"
    erb :login
  end
end

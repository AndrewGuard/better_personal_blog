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

get '/user/posts/:id' do
  @user_posts = User.find(session[:id]).posts
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
  @post = Post.create(post_title: params[:post_title], post_text: params[:post_text])
  redirect to "/posts/#{@post.id}"
end

post '/auth_user' do
  @posts = Post.all
  @user = User.find_by_email(params[:email])
  if @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect to '/'
  else
    redirect to '/'
  end
end

post '/post/:id/destroy' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect to '/'
end

post '/create_user' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  session[:id] = @user.id
  redirect to '/'
end




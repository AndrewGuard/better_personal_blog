# GET ========================================================================================================

get '/' do
  @posts = Post.all
  erb :index
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :post
end

get '/login' do
  erb :login
end

# POST =======================================================================================================

post '/post/:post_id/create_comment' do
  # Verify user
  # Verify session

  comment = Comment.create(comment_text: params[:comment_text], post_id: params[:post_id])
  redirect to "/posts/#{params[:post_id]}"
end
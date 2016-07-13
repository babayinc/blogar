#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:blog.db"

class Post < ActiveRecord::Base
	validates :username, presence: true
	validates :content, presence: true
end

class Comment < ActiveRecord::Base
	belongs_to :post
end


get '/' do
	erb "Hello!"
end

get '/new' do
	erb :new
end

post '/new' do
	post = Post.new params[:post]

	if post.save
		redirect to('/')
	else
		@error = post.errors.full_messages.first
		erb :new
	end
end

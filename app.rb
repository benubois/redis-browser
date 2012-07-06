module RedisViewer
  class App < Sinatra::Base

    register Mustache::Sinatra
    require 'views/layout'
    
    dir = File.dirname(File.expand_path(__FILE__))
    
    set :mustache, {
      :namespace => RedisViewer,
      :templates => "#{dir}/templates",
      :views => "#{dir}/views"
    }

    get "/" do
      mustache :index
    end

    get "/:key" do
      @key = params[:key]
      @type = $redis.type(@key)
      mustache :show, :layout => false
    end
  
  end
end
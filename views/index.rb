module RedisViewer
  
  module Views
    class Index < Layout
      
      def keys
        $redis.keys("*").map{ |key| 
          {:key => key, :type => $redis.type(key) } 
        }
      end
      
    end
  end
  
end
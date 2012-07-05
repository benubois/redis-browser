module RedisViewer
  module Views
    class Show < Layout
      
      def data
        case $redis.type(@key)        
        when "string"
          Array($redis[@key]).map{ |value| {'value' => value} }
        when "list"
          $redis.lrange(@key, 0, -1).map{ |value| {'value' => value} }
        when "set"
          $redis.smembers(@key).map{ |value| {'value' => value} }
        when "hash"
          $redis.hgetall(@key).map{ |key, value| {'key' => key, 'value' => value} }
        else
          []
        end
      end
      
    end
  end
end

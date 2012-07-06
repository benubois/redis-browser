module RedisViewer
  module Views
    class Show < Layout
      
      def has_key
        @type == 'hash'
      end
      
      def data
        case @type
        when "string"
          [{'value' => $redis[@key]}]
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

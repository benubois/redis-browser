module RedisViewer
  module Views
    class Layout < Mustache
      
      def title 
        @title || "Redis Viewer"
      end
      
    end
  end
end
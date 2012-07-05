module RedisViewer
  module Views
    class Layout < Mustache
      
      def title 
        @title || "Redis Browser"
      end
      
    end
  end
end
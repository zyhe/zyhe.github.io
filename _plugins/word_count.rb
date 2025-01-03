# filepath: /_plugins/word_count.rb
module Jekyll
    module WordCount
      def number_of_words(input)
        # Remove HTML tags and count words
        input = input.gsub(/<\/?[^>]*>/, "")
        # Count Chinese characters and words separately
        chinese_characters = input.scan(/[\u4e00-\u9fa5]/).size
        words = input.scan(/\w+/).size
        chinese_characters + words
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::WordCount)
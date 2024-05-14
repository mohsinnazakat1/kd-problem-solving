class Problem2
  class << self
    def call(str)
      return "Input should be string not: #{str}"  unless str.is_a?(String) &&
            str.match?(alphanumeric_regex = /\A[a-zA-Z0-9]+\z/)

      @curr_hash = Hash.new
      @prev_hash = Hash.new
      @curr_length = 0
      @prev_length = 0
      @lock = false
      @repeate = false
      @str_length = str.length / 2 + 1

      str.split("").each do |char|
        @ch = char
        get_hash
      end

      @lock = true
      swap
      @prev_hash.keys.join("") + " is the longest substring without repeating characters" + " with length: #{@prev_length}"
    end

      private

        def get_hash
          uniq_keys
          swap

          if @lock
            uniq_keys
            swap
          end
        end

        def uniq_keys
          if !(@curr_hash.has_key?(@ch))
            @curr_hash[@ch] = @ch
            @curr_length += 1
            @lock = false
          else
            @lock = true
            @repeate = true
          end
          @lock
        end

        def swap
          if @curr_length >= @prev_length && @lock
            @prev_hash = @curr_hash
            @prev_length = @curr_length

            update_hash
          end

          if @repeate
            update_hash
          end
        end

        def update_hash
          index = @curr_hash.keys.index(@ch)
          keys_to_be_removed = @curr_hash.keys[0..index]
          @curr_hash = @curr_hash.except(*keys_to_be_removed)
          @curr_length = @curr_length - keys_to_be_removed.length
          @lock = true
          @repeate = false
        end
  end
end

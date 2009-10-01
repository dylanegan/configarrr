# From https://gist.github.com/raw/6391/a9de33bb917726d4983fa07971af21fb5c664f70/hash_recursive_merge.rb

module CoreExt
  module Hash
    module RecursiveMerge
      def recursive_merge!(other_hash)
        merge!(other_hash) do |key, _old, _new| 
            _old.class == self.class ? _old.recursive_merge!(_new) : _new
        end
      end

      def recursive_merge(other_hash)
        r = {}
        merge(other_hash)  do |key, _old, _new| 
          r[key] = _old.class == self.class ? _old.recursive_merge(_new) : _new
        end
      end
    end
  end
end

class Hash
  include CoreExt::Hash::RecursiveMerge
end

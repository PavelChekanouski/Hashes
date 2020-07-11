class HashesManager

  def safe_invert(hash)
    new_hash = {}
    hash.each do |key, value|
      if (value.is_a? Array)
        value.each do |x| 
          if(new_hash.has_key?(x))
            new_hash[x] = [key, new_hash[x]] 
          else
            new_hash[x] = key
          end
        end
      else
        if(new_hash.has_key?(value))
          new_hash[value] = [key, new_hash[value]] 
        else
          new_hash[value] = key
        end
      end
    end
  end
  

  def to_histogram(data)
    data.group_by {|x| x}.map{ |key, value| [key, value.size] }.to_h
  end

end
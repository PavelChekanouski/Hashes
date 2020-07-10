  class Hashes
  
  def task1()
    
  end

  def task2(fruits_country)
    new_hash = {}
    fruits_country.each do |key, value|
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
    return new_hash
  end
  

  def task3(data)
    data.group_by {|x| x}.map{ |key, value| [key, value.size] }.to_h
  end

end
module ETL
  
  def self.transform(data)
    data.each_with_object({}) do |(key,values), new_data|
      standarize_and_cross_invert(new_data, values, key)
    end
  end

  private

    def self.standarize_and_cross_invert(store, new_keys, value)
      new_keys.each do |key|
        store[key.downcase] = value
      end
    end

end
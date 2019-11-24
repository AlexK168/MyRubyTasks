class Hash
    def safe_add(key, value)
        if self.has_key?(key)
            self[key] = [value, self[key]].flatten
        else
            self[key] = value
        end
    end

    def safe_invert
        new_hash = {}
        self.each do |key, value|
            if value.is_a? Array
                value.each {|item| new_hash.safe_add(item, key)} 
            else
                new_hash.safe_add(value, key)
            end
        end
        new_hash
    end
end

histogram = {
    'orange' => 'Marocco',
    'lemon' => 'Ecuador',
    'banana' => 'Marocco',
}

p histogram.safe_invert



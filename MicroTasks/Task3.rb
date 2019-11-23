class Array
    def to_histogram
        histogram = Hash.new(0)
        self.each do |item|
            histogram[item] += 1
        end
        return histogram
    end    
end

arr = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon']
p arr.to_histogram
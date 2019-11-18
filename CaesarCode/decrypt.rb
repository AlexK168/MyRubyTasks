map = %w{ a b c d e f g h i j k l m n o p q r s t u v w x y z }
shift = ARGV[0].to_i
inputFile = open "C:/Alex/Ruby/Projects/encrypted_msg.txt"
outputFile = File.open( "C:/Alex/Ruby/Projects/decrypted_msg.txt", "w")
inputFile.each do |line|
    line.downcase.each_char do |symbol|
        if symbol =~ /\w/
            index = map.index(symbol)?map.index(symbol) - shift : 0
            index = index >= 0 ? index : map.length + index
            outputFile.putc map[index]?map[index] : 0
        else
            outputFile.putc symbol
        end
    end
end
inputFile.close
outputFile.close

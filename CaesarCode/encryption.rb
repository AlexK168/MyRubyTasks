class Encryption
    attr_accessor :shift

    def initialize(shift)
       @shift = shift.to_i
    end

    def encrypt 
        letters = %w{ a b c d e f g h i j k l m n o p q r s t u v w x y z }
        inputFile = open "C:/Alex/Ruby/Projects/CaesarCode/message.txt"
        outputFile = File.open( "C:/Alex/Ruby/Projects/CaesarCode/encrypted_msg.txt", "w")
        inputFile.each do |line|
            line.downcase.each_char do |symbol|
                if symbol =~ /\w/
                    index = letters.index(symbol)? letters.index(symbol) + shift : 0
                    index = index < letters.length ? index : index - letters.length
                    outputFile.putc letters[index]? letters[index] : 0
                else
                    outputFile.putc symbol
                end
            end
        end
        inputFile.close
        outputFile.close
    end

    def decrypt
        letter = %w{ a b c d e f g h i j k l m n o p q r s t u v w x y z }
        inputFile = open "C:/Alex/Ruby/Projects/CaesarCode/encrypted_msg.txt"
        outputFile = File.open( "C:/Alex/Ruby/Projects/CaesarCode/decrypted_msg.txt", "w")
        inputFile.each do |line|
            line.downcase.each_char do |symbol|
                 if symbol =~ /\w/
                    index = letter.index(symbol)? letter.index(symbol) - shift : 0
                    index = index >= 0 ? index : letter.length + index
                    outputFile.putc letter[index]? letter[index] : 0
                else
                    outputFile.putc symbol
                end
            end
        end
        inputFile.close
        outputFile.close
    end
end

msg_encrypt = Encryption.new(ARGV[0])
puts "successfully encrypted" if msg_encrypt.encrypt
puts "successfully decrypted" if msg_encrypt.decrypt

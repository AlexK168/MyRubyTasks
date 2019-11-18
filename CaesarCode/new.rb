h = 
{
    fender: 'guitar',
    yamaha: 'guitar',
    cervini: 'violin',
    dunlop: 'guitar pick'
}

h_enum = h.to_enum
loop do
    puts "#{h_enum.next}"
end
result = [] 
String a = "very_long_sring"
a.each_char.with_index {|item, index|
     result << [item, index]}
puts result



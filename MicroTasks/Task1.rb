sum = {
    'days' => lambda {|date, duration| 
        calendar = [31,28,31,30,31,30,31,31,30,31,30,31]
        month = date[3..4].to_i - 1
        day = date[0..1].to_i + duration
        while day > calendar[month] do
            day -= calendar[month]
            date = sum['months'].call(date, 1)
            month = date[3..4].to_i - 1
        end
        date.sub(/(\d\d)/){day.to_s.rjust(2, '0')}
    },
    'years' => lambda {|date, duration| 
        date.sub(/(\d\d\d\d)/){$1.to_i + duration}
    },
    'months' => lambda {|date, duration| 
        month = date[3..4].to_i + duration
        while month > 12 do
            month -= 12 
            date = sum['years'].call(date, 1)
        end
        date[3, 2] = month.to_s.rjust(2, '0')
        date
    }
}
puts 'Enter date'
_date = gets.to_s.chomp
puts 'Enter amount of inputs:'
_n = gets.to_i
0.upto(_n - 1) do
    puts 'Enter unit:'
    _unit = gets.to_s.chomp
    puts 'Enter value'
    _duration = gets.to_i
    puts sum[_unit].call(_date, _duration)
end

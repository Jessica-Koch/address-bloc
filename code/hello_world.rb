def greet
    salute = ARGV[0]
    ARGV.each do |arg|
        if arg != salute
            puts "#{salute} #{arg}"
        end
    end
end

greet

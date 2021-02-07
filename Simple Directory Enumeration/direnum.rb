require 'net/http'

def Enumerate(url, file)
    e = File.exists?(file)
    if (e != true) then abort("File does not exist!") end
    File.open(file).each do |line|
        begin
            uri = "#{url}#{url.end_with?("/") ? "" : "/"}#{line.gsub("\n", "")}"
            response = Net::HTTP.get_response(URI(uri))
            print "#{uri}/ : #{response.code} #{response.message}\n"
        rescue => exception
            print (exception + "\n")
        end
    end
end

if (ARGV.length < 2 or ARGV.length > 2) then abort("Example: direnum.rb https://example.com/ dir-small.txt") end
Enumerate(ARGV[0], ARGV[1])
# This is a helper funtion for triming content
module MessagesHelper
    def trimContent(content)
        counter = 0.0
        ret = ""
        content.each_char do |c|
            if(c == "\n")
                counter = counter+1
                counter.floor
            else
                counter = counter+0.01
            end
            ret = ret + c
            if(counter > 14)
                ret = ret + "..."
                break
            end
        end
        ret
    end
end

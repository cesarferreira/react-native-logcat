require 'open3'
require 'colorize'

module ReactNativeLogCat

  def self.add_timestamp(str)
    timestamp = Time.now.strftime("%H:%M:%S")
    return "[#{timestamp}] #{str}"
  end

  def self.clean(str)
    return str[/^[A-Z]\/.*\):(.*)/,1]
  end

  def self.transform_line(str)

    if str[0..1] == "D/"
      return add_timestamp(clean(str).green)
    end

    if str[0..1] == "W/"
      return add_timestamp(clean(str).yellow)
    end

    if str[0..1] == "E/"
      return add_timestamp(clean(str).red)
    end

    if str[0..1] == "I/"
      return add_timestamp(clean(str).white)
    end

    return add_timestamp(str)
  end

  def self.start
    cmd='
    adb logcat *:S ReactNative:V ReactNativeJS:V | {
      while IFS= read -r line
      do
        echo "$line"
      done
    }'

    IO.popen(cmd).each do |line|
      puts self.transform_line(line.chomp)
    end
  end

end

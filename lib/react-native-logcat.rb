require 'open3'
require 'colorize'

module ReactNativeLogCat

  def self.get_type(str)

    if str[0..1] == "D/"
      return str.green
    end

    if str[0..1] == "W/"
      return str.yellow
    end

    return str
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
      puts self.get_type(line.chomp)
    end
  end

end

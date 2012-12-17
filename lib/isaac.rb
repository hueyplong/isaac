require 'isaac/bot'

$bot = Isaac::Bot.new

%w(configure helpers on).each do |method|
  eval(<<-EOF)
    def #{method}(*args, &block)
      $bot.#{method}(*args, &block)
    end
  EOF
end

# Commenting this out as it causes local connection attempt after every rake
#at_exit do
#  unless defined?(Test::Unit)
#    raise $! if $!
#    $bot.start
#  end
#end

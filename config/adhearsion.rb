# encoding: utf-8

Adhearsion.config do |config|
  config.platform.logging.level = :trace

  config.platform.dial_target = "SIP/1@tincan.mojolingo.com"
  #config.platform.dial_target = "Local/77@default"
end

Adhearsion.router do
  route 'SimpleProfile', :to => '1' do
    answer
    play "tt-monkeys"
    execute "WaitExten", 120
    hangup
  end

  route 'EarlyProfile', :to => '2' do
    play "#{Adhearsion.config[:platform].root}/sounds/80sec-monkeys"
    answer
    play "tt-weasels"
    hangup
  end

  route 'InputProfile', :to => '3' do
    answer
    play "#{Adhearsion.config[:platform].root}/sounds/25sec-monkeys"
    result = ask :limit => 1, :timeout => 10000
    play "tt-weasels"
    hangup
  end

  route 'DialProfile', :to => '4' do
    answer
    dial_target = ENV['DIAL_TARGET'] || Adhearsion.config.platform.dial_target
    logger.info "Dialing #{dial_target}"
    dial dial_target
    hangup
  end
end

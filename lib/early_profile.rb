# encoding: utf-8

class EarlyProfile < Adhearsion::CallController
  def run
    play "#{Adhearsion.config[:platform].root}/sounds/80sec-monkeys"
    answer
    play "tt-weasels"
    hangup
  end
end

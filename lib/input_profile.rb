# encoding: utf-8

class InputProfile < Adhearsion::CallController
  def run
    answer
    play "#{Adhearsion.config[:platform].root}/sounds/25sec-monkeys"
    result = ask :limit => 1, :timeout => 10000
    play "tt-weasels"
    hangup
  end
end

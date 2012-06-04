# encoding: utf-8

class EarlyProfile < Adhearsion::CallController
  def run
    play "tt-weasels"
    answer
    play "tt-monkeys"
    hangup
  end
end

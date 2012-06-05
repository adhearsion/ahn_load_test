# encoding: utf-8

class SimpleProfile < Adhearsion::CallController
  def run
    answer
    play "tt-monkeys"
    execute "WaitExten", 120
    hangup
  end
end

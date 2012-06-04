# encoding: utf-8

class InputProfile < Adhearsion::CallController
  def run
    play "tt-weasels"
    answer
    result = ask :limit => 1, :timeout => 5000
    logger.info result
    play "tt-monkeys"
    hangup
  end
end

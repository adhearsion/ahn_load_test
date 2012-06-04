# encoding: utf-8

class SimpleProfile < Adhearsion::CallController
  def run
    answer
    sleep rand(30..60)
    hangup
  end
end

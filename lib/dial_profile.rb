# encoding: utf-8

class SimpleProfile < Adhearsion::CallController
  def run
    answer
    dial("SIP/100@whatever.com")
    hangup
  end
end

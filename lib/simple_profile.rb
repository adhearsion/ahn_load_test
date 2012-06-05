# encoding: utf-8

class SimpleProfile < Adhearsion::CallController
  def run
    answer
    sleep rand(30..58)
    logger.info "Hanging up"
    hangup
  end
end

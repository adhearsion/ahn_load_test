# encoding: utf-8

class DialProfile < Adhearsion::CallController
  def run
    answer
    dial_target = ENV['DIAL_TARGET'] || Adhearsion.config.platform.dial_target
    logger.info "Dialing #{dial_target}"
    dial dial_target
    hangup
  end
end

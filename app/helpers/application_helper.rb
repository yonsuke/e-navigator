module ApplicationHelper
  def interview_datetime(start_time)
    start_time.strftime("%Y年%m月%d日(#{%w(日 月 火 水 木 金 土)[start_time.wday]}) %H時%M分")
  end
end

module PeriodsHelper
  def monday(model, time)
    period = model.find_by(weekday: "月", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
    # 登録済みの時間割を編集できるようにする！！！！！！！！！
  end

  def tuesday(model, time)
    period = model.find_by(weekday: "火", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
  end

  def wednesday(model, time)
    period = model.find_by(weekday: "水", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
  end

  def thursday(model, time)
    period = model.find_by(weekday: "木", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
  end

  def friday(model, time)
    period = model.find_by(weekday: "金", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
  end

  def saturday(model, time)
    period = model.find_by(weekday: "土", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
  end

  def sunday(model, time)
    period = model.find_by(weekday: "日", period_num: time + 1)
    subject_str = period&.subject
    link_to subject_str, edit_period_path(period.id) if subject_str
  end

  def period_edit_link(weekday, time)
    link_to '登録', new_period_path(weekday: weekday, period_num: time)
  end
end

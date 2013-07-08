Date::DATE_FORMATS[:week] = ->(date) {
  date.strftime("#{date.beginning_of_week.day} - #{date.end_of_week.day} %b")
}

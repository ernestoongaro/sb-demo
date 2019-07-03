view: timeperiods {

  sql_table_name:  {% parameter account_position_summary.position %};;


  dimension: week_key {
    group_label: "Week"
  }
  dimension: week_number {
    group_label: "Week"
  }

  dimension: day_key {
    group_label: "Day"
  }
  dimension: day_number {
    group_label: "Day"
  }

}

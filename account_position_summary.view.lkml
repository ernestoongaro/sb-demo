view: account_position_summary {

  sql_table_name:  {% parameter position %};;

  dimension: day_key {}
  dimension: week_key {}
  dimension: primary_key { primary_key: yes hidden: yes}

  parameter: position {
    type: unquoted
    allowed_value: {
      label: "daily"
      value: "fact.daily_account_position"
    }
    allowed_value: {
      label: "weekly"
      value: "fact.weekly_account_position"
    }
    allowed_value: {
      label: "monthly"
      value: "fact.monthly_account_position"
    }
    allowed_value: {
      label: "quarterly"
      value: "fact.quarterly_account_position"
    }
    allowed_value: {
      label: "yearly"
      value: "fact.yearly_account_position"
    }
  }

  dimension: balance_calc {
    hidden: yes
    sql:
    {% if position._parameter_value == 'fact.daily_account_position' %}
      ${TABLE}.balance
    {% else %}
      ${TABLE}.closing_balance
    {% endif %} ;;
  }
  measure: closing_balance {
    label: "
    {% if position._parameter_value == 'fact.daily_account_position' %}
    Closing Balance
    {% else %}
    Balance
    {% endif %}
    "
    type: sum
    sql: ${balance_calc} ;;
  }

}

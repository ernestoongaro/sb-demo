connection: "snowflake"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: account_position_summary {

  join: timeperiods {
    ## note: use sql not sql_on
    sql:
    -- note: fully qualify the parameter name (view_name.parameter_name
    {% if account_position_summary.position._parameter_value == 'fact.daily_account_position' %}
     LEFT JOIN ${timeperiods.SQL_TABLE_NAME} AS timeperiods ON ${account_position_summary.day_key} = ${timeperiods.day_key}
     {% elsif account_position_summary.position._parameter_value == 'fact.weekly_account_position' %}
     LEFT JOIN ${timeperiods.SQL_TABLE_NAME} AS timeperiods ON ${account_position_summary.week_key} = ${timeperiods.week_key}
    {% else %}
      1 = 1 --not joined
    {% endif %}
    ;;
  relationship: many_to_one

  }

}

connection: "snowflake"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard



explore: events {
  join: users {
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

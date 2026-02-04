connection: "snowflake_test"

include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard"

#datagroup: daily_refresh {
 # sql_trigger: SELECT MAX(orderid) FROM orders ;;
  #max_cache_age: "24 hours"
#}

explore: orders {
  join: maximum_date {
    type: cross
    relationship: one_to_one
  }
  #persist_for: "24 hours"
   #sql_always_where: ${orders.city} = 'New York City' ;;
  #always_filter: {
  #  filters: [orders.category: "Furniture"]
 # }
  join: returns {
    type: left_outer
    relationship: many_to_many
    sql_on: ${orders.order_id}=${returns.order_id} ;;
  }
}
explore: people {}

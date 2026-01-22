connection: "snowflake_test"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this

datagroup: daily_refresh {
  sql_trigger: SELECT MAX(orderid) FROM orders ;;
  max_cache_age: "24 hours"
}

explore: orders {
  persist_for: "24 hours"
   sql_always_where: ${orders.city} = 'New York City' ;;
  always_filter: {
    filters: [orders.category: "Furniture"]
  }
  join: returns {
    type: left_outer
    relationship: one_to_one
    sql_on: ${orders.orderid}=${returns.order_id} ;;
  }
}
explore: people {}

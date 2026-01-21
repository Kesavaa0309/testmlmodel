connection: "snowflake_test"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this

explore: orders {
  always_filter: {
    filters: [orders.city: "New York City"]
  }
  join: returns {
    type: left_outer
    relationship: one_to_one
    sql_on: ${orders.orderid}=${returns.order_id} ;;
  }
}
explore: people {}

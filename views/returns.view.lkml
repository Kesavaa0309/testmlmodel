view: returns {
  sql_table_name: `default`.returns ;;

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.`Order ID` ;;
  }
  dimension: returned {
    type: string
    sql: ${TABLE}.`Returned` ;;
  }
  measure: count {
    type: count
    drill_fields: [orders.productname, orders.customername, orders.orderid]
  }
}

view: maximum_date {
  derived_table: {
    sql: select max(order_date) as max_date from default.orders ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: max_date {
    type: date
    sql: ${TABLE}."MAX_DATE" ;;
  }

  set: detail {
    fields: [
        max_date
    ]
  }
}

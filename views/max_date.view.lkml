view: max_date {
  derived_table: {
    sql: {% raw %} select max(ORDER_DATE) as max_week_ending from db.orders {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: max_week_ending {
    type: date
    sql: ${TABLE}.max_week_ending ;;
  }

  set: detail {
    fields: [
        max_week_ending
    ]
  }
}
view: max_date {
  derived_table: {
    sql: {% raw %} select max(`Order Date`) as max_week_ending from default.orders {% endraw %} ;;
  }

  suggestions: no
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

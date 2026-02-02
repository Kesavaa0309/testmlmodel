
view: custom_sql_query1 {
  derived_table: {
    sql: {% raw %} select ORDERID, CITY, CATEGORY from PUBLIC.ORDERS {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orderid {
    type: string
    sql: ${TABLE}."ORDERID" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  set: detail {
    fields: [
        orderid,
	city,
	category
    ]
  }
}

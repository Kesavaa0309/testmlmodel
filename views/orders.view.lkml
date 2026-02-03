view: orders {
  sql_table_name: "PUBLIC"."ORDERS" ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    description: "The unique identifier for each transaction. Use this for counting specific orders."
    sql: ${TABLE}."ORDER_ID" ;;
  }
  dimension: category {
    type: string
    description: "The broad grouping of products, such as Furniture, Technology, or Office Supplies."
    sql: ${TABLE}."CATEGORY" ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }
  dimension: customer_name {
    type: string
    description: "The name of the person who placed the order."
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }
  dimension: discount {
    type: number
    sql: ${TABLE}."DISCOUNT" ;;
  }
  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_DATE" ;;
  }
  dimension: postal_code {
    type: number
    sql: ${TABLE}."POSTAL_CODE" ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}."PRODUCT_NAME" ;;
  }
  dimension: profit {
    type: number
    sql: ${TABLE}."PROFIT" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }
  dimension: row_id {
    type: number
    sql: ${TABLE}."ROW_ID" ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}."SALES" ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }
  dimension_group: ship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SHIP_DATE" ;;
  }
  dimension: ship_mode {
    type: string
    sql: ${TABLE}."SHIP_MODE" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }
  dimension: subcategory {
    type: string
    description: "More specific product grouping (e.g., Chairs, Phones, Paper)."
    sql: ${TABLE}."Sub-Category" ;;
  }
  measure: count {
    type: count
    drill_fields: [order_id, product_name, customer_name]
  }
}

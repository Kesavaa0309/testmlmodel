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
  measure: discount {
    type: sum
    sql: ${TABLE}."DISCOUNT" ;;
  }
  dimension_group: order_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_DATE" ;;
  }
  dimension: postal_code {
    type: zipcode
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
  measure: profit {
    type: sum
    sql: ${TABLE}."PROFIT" ;;
  }
  measure: quantity {
    type: sum
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
  measure: sales {
    type: sum
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

  parameter: Date_Range {
    type: string
    label: "date range"
    default_value: "last 52 weeks"

    allowed_value: {
      label: "last 52 weeks"
      value: "last 52 weeks"
    }
    allowed_value: {
      label: "last 26 weeks"
      value: "last 26 weeks"
    }
    allowed_value: {
      label: "last 13 weeks"
      value: "last 13 weeks"
    }
    allowed_value: {
      label: "last 4 weeks"
      value: "last 4 weeks"
    }
    allowed_value: {
      label: "YTD"
      value: "YTD"
    }
  }
}

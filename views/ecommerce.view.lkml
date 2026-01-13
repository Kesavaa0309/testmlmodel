view: ecommerce {
  sql_table_name: "PUBLIC"."ECOMMERCE" ;;

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }
  dimension: payment_method {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD" ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY" ;;
  }
  dimension: purchase_amount {
    type: number
    sql: ${TABLE}."PURCHASE_AMOUNT" ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }
  dimension: transaction_id {
    type: number
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }
  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }
  measure: count {
    type: count
    drill_fields: [user_name]
  }
}

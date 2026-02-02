view: orders {
  sql_table_name: "PUBLIC"."ORDERS" ;;
  drill_fields: [orderid]

  dimension: orderid {
    primary_key: yes
    type: string
    sql: ${TABLE}."ORDERID" ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }
  dimension: countryorregion {
    type: string
    sql: ${TABLE}."COUNTRYORREGION" ;;
  }
  dimension: customerid {
    type: string
    sql: ${TABLE}."CUSTOMERID" ;;
  }
  dimension: customername {
    type: string
    sql: ${TABLE}."CUSTOMERNAME" ;;
  }
  dimension: discount {
    type: number
    sql: ${TABLE}."DISCOUNT" ;;
  }
  dimension: orderdate {
    type: string
    sql: ${TABLE}."ORDERDATE" ;;
  }
  dimension_group: orderdate {
    type: time
    description: "Order Date"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ORDERDATE ;;
  }
  dimension: postalcode {
    type: string
    sql: ${TABLE}."POSTALCODE" ;;
  }
  dimension: productid {
    type: string
    sql: ${TABLE}."PRODUCTID" ;;
  }
  dimension: productname {
    type: string
    sql: ${TABLE}."PRODUCTNAME" ;;
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
  dimension: rowid {
    type: number
    value_format_name: id
    sql: ${TABLE}."ROWID" ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}."SALES" ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }
  dimension_group: shipdate {
    type: time
    description: "Ship Date"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.SHIPDATE ;;
  }
  dimension: shipmode {
    type: string
    sql: ${TABLE}."SHIPMODE" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }
  dimension: subcategory {
    type: string
    sql: ${TABLE}."SUBCATEGORY" ;;
  }
  measure: count {
    type: count
    drill_fields: [orderid, productname, customername, returns.count]
  }
}

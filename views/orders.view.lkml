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
    map_layer_name:  us_zipcode_tabulation_areas
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

  dimension: date_filter {
    type: string
    label: "date_filter"
    hidden: no
    sql:
    CASE
      WHEN {% parameter Date_Range %} = 'last 52 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) >= DATEADD('week', -51, DATE(${max_date.max_week_ending})) AND
               DATE(${TABLE}.order_date) <= DATE(${max_date.max_week_ending}) THEN ${TABLE}.order_date
        END
      WHEN {% parameter Date_Range %} = 'last 26 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) >= DATEADD('week', -25, DATE(${max_date.max_week_ending})) AND
               DATE(${TABLE}.order_date) <= DATE(${max_date.max_week_ending}) THEN ${TABLE}.order_date
        END
      WHEN {% parameter Date_Range %} = 'last 13 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) >= DATEADD('week', -12, DATE(${max_date.max_week_ending})) AND
               DATE(${TABLE}.order_date) <= DATE(${max_date.max_week_ending}) THEN ${TABLE}.order_date
        END
      WHEN {% parameter Date_Range %} = 'last 4 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) >= DATEADD('week', -3, DATE(${max_date.max_week_ending})) AND
               DATE(${TABLE}.order_date) <= DATE(${max_date.max_week_ending}) THEN ${TABLE}.order_date
        END
      WHEN {% parameter Date_Range %} = 'YTD' THEN
        CASE
          WHEN EXTRACT(YEAR FROM DATE(${TABLE}.order_date)) = EXTRACT(YEAR FROM DATE(${max_date.max_week_ending})) AND
               DATE(${TABLE}.order_date) <= DATE(${max_date.max_week_ending}) THEN ${TABLE}.order_date
        END
    END ;;
  }

  dimension: date_filter_comparison {

    type: string
    label: "date_filter_comparison"
    hidden: no
    sql:
    CASE
      WHEN {% parameter Date_Range %} = 'last 52 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) BETWEEN DATEADD('week', -103, DATE(${max_date.max_week_ending}))
                                            AND DATEADD('week', -52, DATE(${max_date.max_week_ending}))
          THEN TO_CHAR(${TABLE}.order_date, 'YYYY-MM-DD')
        END
      WHEN {% parameter Date_Range %} = 'last 26 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) BETWEEN DATEADD('week', -51, DATE(${max_date.max_week_ending}))
                                            AND DATEADD('week', -26, DATE(${max_date.max_week_ending}))
          THEN TO_CHAR(${TABLE}.order_date, 'YYYY-MM-DD')
        END
      WHEN {% parameter Date_Range %} = 'last 13 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) BETWEEN DATEADD('week', -25, DATE(${max_date.max_week_ending}))
                                            AND DATEADD('week', -13, DATE(${max_date.max_week_ending}))
          THEN TO_CHAR(${TABLE}.order_date, 'YYYY-MM-DD')
        END
      WHEN {% parameter Date_Range %} = 'last 4 weeks' THEN
        CASE
          WHEN DATE(${TABLE}.order_date) BETWEEN DATEADD('week', -7, DATE(${max_date.max_week_ending}))
                                            AND DATEADD('week', -4, DATE(${max_date.max_week_ending}))
          THEN TO_CHAR(${TABLE}.order_date, 'YYYY-MM-DD')
        END
      WHEN {% parameter Date_Range %} = 'YTD' THEN
        CASE
          WHEN EXTRACT(YEAR FROM DATE(${TABLE}.order_date)) = EXTRACT(YEAR FROM DATEADD('year', -1, DATE(${max_date.max_week_ending})))
               AND DATE(${TABLE}.order_date) <= DATEADD('year', -1, DATE(${max_date.max_week_ending}))
          THEN TO_CHAR(${TABLE}.order_date, 'YYYY-MM-DD')
        END
    END ;;
  }
  measure: Sales_date_filter_not_null{
    type: sum
    label: "Current Sales"
    sql:
        CASE WHEN ${date_filter} IS NOT NULL THEN ${TABLE}."SALES"
        ELSE 0
        END;;
    value_format_name: usd_0
  }
  measure: Sales_date_filter_comparison_not_null{
    type: sum
    label: "Previous Sales"
    sql:
        CASE WHEN ${date_filter_comparison} IS NOT NULL THEN ${TABLE}."SALES"
        ELSE 0
        END;;
    value_format_name: usd_0
  }
  measure: current_orders_filtered {
    type: count_distinct
    label: "Current Order"
    sql: ${TABLE}."ORDER_ID" ;;
    filters: [date_filter: "-NULL"]  # This means "Where date_filter is NOT NULL"
  }
  measure: Orders_date_filter_comparison_not_null {
    type: count_distinct
    label: "Previous Order"
    sql: ${TABLE}."ORDER_ID" ;;
    filters: [date_filter_comparison: "-NULL"]  # This means "Where date_filter is NOT NULL"
  }
  measure: Profit_date_filter_not_null{
    type: sum
    label: "Current Profit"
    sql:
        CASE WHEN ${date_filter} IS NOT NULL THEN ${TABLE}."PROFIT"
        ELSE 0
        END;;
    value_format_name: usd_0
  }
  measure: Profit_date_filter_comparison_not_null{
    type: sum
    label: "Previous Profit"
    sql:
        CASE WHEN ${date_filter_comparison} IS NOT NULL THEN ${TABLE}."PROFIT"
        ELSE 0
        END;;
    value_format_name: usd_0
  }
  measure: Discount_date_filter_not_null{
    type: sum
    label: "Current Discount"
    sql:
        CASE WHEN ${date_filter} IS NOT NULL THEN ${TABLE}."DISCOUNT"
        ELSE 0
        END;;
    value_format_name: usd_0
  }
  measure: Discount_date_filter_comparison_not_null{
    type: sum
    label: "Previous Discount"
    sql:
        CASE WHEN ${date_filter_comparison} IS NOT NULL THEN ${TABLE}."DISCOUNT"
        ELSE 0
        END;;
    value_format_name: usd_0
  }
}

view: people {
  sql_table_name: "PUBLIC"."PEOPLE" ;;

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }
  dimension: regionalmanager {
    type: string
    sql: ${TABLE}."REGIONALMANAGER" ;;
  }
  measure: count {
    type: count
  }
}

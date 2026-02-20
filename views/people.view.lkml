view: people {
  sql_table_name: default.`people` ;;

  dimension: region {
    type: string
    sql: ${TABLE}.`REGION` ;;
  }
  dimension: regionalmanager {
    type: string
    sql: ${TABLE}.`REGIONALMANAGER` ;;
  }
  measure: count {
    type: count
  }
}

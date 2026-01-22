dashboard: test {
title: "Test"
model: snowflake_test
explore: orders
layout: newspaper
preferred_viewer: dashboards-next

elements: [
  {
  name: hello_world,
  title: "Hello World",
  type: looker_column,

  query: {
  model: snowflake_test,
  explore: orders,
  dimensions: [orders.city],
measures: [orders.count]
}
}
]

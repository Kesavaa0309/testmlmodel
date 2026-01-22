dashboard: test {
title: "Test"
model: model
explore: orders
layout: newspaper
preferred_viewer: dashboards-next

elements: [
  {
  name: hello_world,
  title: "Hello World",
  type: looker_column,

  query: {
  model: model,
  explore: orders,
  dimensions: [orders.city],
measures: [orders.count]
}
}
]

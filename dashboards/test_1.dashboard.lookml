- dashboard: sales_overview
  title: "Sales Overview"
  layout: newspaper
  elements:
    - name: total_orders
      type: single_value
      model: model
      explore: orders
      measures: [orders.count]

    - name: Yearly_sales
      type: looker_bar
      model: model
      explore: orders
      measures: [orders.sales]

- dashboard: sales_summary
  title: "Sales Summary"
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:
  - name: region_filter
    title: "Region"
    type: field_filter
    model: model
    explore: orders
    field: orders.region
    ui_config:
      type: checkboxes
      display: inline

  elements:
  - name: yearly_sales
    title: "Yearly Sales"
    model: model
    explore: orders
    type: looker_column
    fields: [orders.order_date_year, orders.sales]
    show_legend: false
    sorts: [orders.order_date_year asc]
    listen:
      region_filter: orders.region
    row: 0
    col: 0
    width: 24
    height: 6

  - name: category_vs_sales
    title: "Category vs Sales"
    model: model
    explore: orders
    type: looker_pie
    fields: [orders.category, orders.sales]
    value_labels: none
    listen:
      region_filter: orders.region
    row: 6
    col: 0
    width: 6
    height: 6

  - name: subcategory_vs_sales
    title: "SubCategory vs Sales"
    model: model
    explore: orders
    type: looker_pie
    fields: [orders.subcategory, orders.sales]
    value_labels: none
    listen:
      region_filter: orders.region
    row: 6
    col: 6
    width: 6
    height: 6

  - name: category_vs_profit
    title: "Category vs Profit"
    model: model
    explore: orders
    type: looker_pie
    fields: [orders.category, orders.profit]
    value_labels: none
    listen:
      region_filter: orders.region
    row: 6
    col: 12
    width: 6
    height: 6

  - name: subcategory_vs_profit
    title: "SubCategory vs Profit"
    model: model
    explore: orders
    type: looker_pie
    fields: [orders.subcategory, orders.profit]
    value_labels: none
    listen:
      region_filter: orders.region
    row: 6
    col: 18
    width: 6
    height: 6

  - name: sales_by_segment
    title: "Sales by Segment"
    model: model
    explore: orders
    type: looker_bar
    fields: [orders.segment, orders.sales]
    pivots: [orders.segment]
    sorts: [orders.segment]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    stacking: "normal"
    listen:
      region_filter: orders.region
    row: 12
    col: 0
    width: 24
    height: 4

  - name: subcategory_sales_by_years
    title: "Subcategory Sales by Years"
    model: model
    explore: orders
    type: looker_table
    fields: [orders.order_date_year, orders.subcategory, orders.sales]
    pivots: [orders.subcategory]
    listen:
      region_filter: orders.region
    row: 16
    col: 0
    width: 24
    height: 4

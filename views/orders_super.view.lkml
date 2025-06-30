view: orders_super {
  sql_table_name: `cg-acis-ind-sandbox.super.orders_super` ;;

  dimension: Order_ID {
    label: "Order ID"
    type: number
    sql: ${TABLE}.Order_ID ;;
  }
  dimension: Order_Date {
    label: "Order Date"
    type: date
    sql: ${TABLE}.Order_Date ;;
  }
  dimension: Ship_Date {
    label: "Ship Date"
    type: date
    sql: ${TABLE}.Ship_Date ;;
  }
  dimension: Ship_Mode {
    label: "Ship Mode"
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }
  dimension: Customer_ID {
    label: "Customer ID"
    type: string
    sql: ${TABLE}.Customer_ID ;;
  }
  dimension: Quantity {
    label: "Quantity"
    type: number
    sql: ${TABLE}.Quantity ;;
  }
  measure: Calculation1 {
    label: "Calculation1"
    type: number
    sql: SUM(${Quantity}) * SUM(${sales_super.Profit}) ;;
  }
  dimension: demand {
    label: "Demand"
    type: string
    sql: CASE
    WHEN ${Quantity} * ${sales_super.Sales} > 1000 THEN 'High demand product'
    WHEN ${Quantity} * ${sales_super.Sales} < 1000 THEN 'low demand product'
    END ;;
  }
}
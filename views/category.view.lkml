# The name of this view in Looker is "Category"
view: category {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dvd_rental.category` ;;
  drill_fields: [category_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: category_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.category_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Category Name" in Explore.

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }
  measure: count {
    type: count
    drill_fields: [category_id, category_name, film_category.count]
  }
}

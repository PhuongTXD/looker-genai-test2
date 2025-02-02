# The name of this view in Looker is "Country"
view: country {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dvd_rental.country` ;;
  drill_fields: [country_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: country_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.country_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Country" in Explore.

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  measure: count {
    type: count
    drill_fields: [country_id, city.count]
  }
}

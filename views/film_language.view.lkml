# The name of this view in Looker is "Film Language"
view: film_language {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dvd_rental.film_language` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Language ID" in Explore.

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: language_name {
    type: string
    sql: ${TABLE}.language_name ;;
  }
  measure: count {
    type: count
    drill_fields: [language_name]
  }
}

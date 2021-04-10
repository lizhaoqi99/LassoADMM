#' a Spark example that fits a linear regression model to mtcars dataset
#' and disconnects the Spark cluster
#' @param sc a Spark cluster (create by calling spark_connect)
#' @return fitted linear regresion model
#' @export
#' @examples
#' sparkr_demo(sparklyr::spark_connect(master="local"))
sparkr_demo <- function(sc) {
  cars <- sparklyr::copy_to(sc, datasets::mtcars, overwrite = TRUE) # copy_to returns a reference to the dataset we loaded (cars in this case)
  # use a linear model to approximate the relationship between fuel efficiency and horsepower
  model <- sparklyr::ml_linear_regression(cars, mpg ~ hp)
  sparklyr::spark_disconnect(sc)
  return(model)
}

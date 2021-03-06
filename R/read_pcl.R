#` Read in PCL files
#'
#' \code{read_pcl} imports PCL or portable canopy LiDAR files into the workspace and formats them.
#'
#' This function specificially reads in PCL files that are in .csv format, standard format for that data type.
#'
#' @param f name of file currently being processed
#'
#' @keywords read pcl raw input data
#'
#' @export
#'
#' @seealso
#' \code{\link{process_pcl}}
#' \code{\link{process_multi_pcl}}
#'
#' @examples
#'
#' # Link to raw PCL data, in .csv form.
#' uva_pcl <- system.file("extdata", "UVAX_A4_01W.csv", package = "forestr")
#'
#' # Import PCL data to the workspace
#' pcl_data <-read_pcl(uva_pcl)
#'
#'

read_pcl <- function(f) {
  df <- utils::read.csv(f, header=FALSE, col.names = c("return_distance", "intensity"),
                        blank.lines.skip = FALSE)[,1:2]
  message("how many in base df have NA")
  print(sum(is.na(df$return_distance)))
  df$index <- as.numeric(rownames(df))

  df = df[,c(3, 1, 2)]

  return(df)
}

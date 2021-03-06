% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_tls.R
\name{process_tls}
\alias{process_tls}
\title{Process single PCL transects.}
\usage{
process_tls(f, slice, pavd = FALSE, hist = FALSE)
}
\arguments{
\item{f}{the name of the filename to input <character> or a data frame <data frame>.}

\item{slice}{the number of the transect to use from xyz tls data}

\item{pavd}{logical input to include Plant Area Volume Density Plot from \code{plot_pavd}, if TRUE it is included, if FALSE, it is not.}

\item{hist}{logical input to include histogram of VAI with PAVD plot, if TRUE it is included, if FALSE, it is not.}
}
\value{
writes the hit matrix, summary matrix, and output variables
to csv in an output folder, along with hit grid plot
}
\description{
\code{process_tls} imports and processes a slice from a voxelated TLS scan.
}
\details{
This function takes as input a four column .CSV file or data frame of x, y, z, and VAI
(Vegetation Area Index) derived from 3-D (TLS) LiDAR data. Currently, this function only
 analyzes a single slice from the inputed TLS data set. VAI is calculated externally
 by the user using user-determined methodology.

The \code{process_tls} function will write multiple output files to disk in an (output)
directory that \code{process_tls} creates within the work directing. These files include:

1. an output variables file that contains a list of CSC variables and is
written by the subfunction \code{write_pcl_to_csv}

2. a summary matrix, that includes detailed information on each vertical column of Lidar data
written by the subfunction \code{write_summary_matrix_to_csv}

3. a hit matrix, which is a matrix of VAI at each x and z position, written by the
subfunction \code{write_hit_matrix_to_pcl}

4. a hit grid, which is a graphical representation of VAI along the x and z coordinate space.
5. optionally, plant area/volume density profiles can be created by including
\code{pavd = TRUE} that include an additional histogram with the optional \code{hist = TRUE} in the
\code{process_pcl} call.
}
\examples{

# with designated file
uva.tls<- system.file("extdata", "UVAX_A4_01_tls.csv", package = "forestr")

process_tls(uva.tls, slice = 5, pavd = FALSE, hist = FALSE)


}
\seealso{
\code{\link{process_pcl}}
}
\keyword{processing}
\keyword{tls}

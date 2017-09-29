#' @include soccerHeatmap.R
NULL
#' Draws a heatmap of player position and plots over soccer pitch outlines.
#' 
#' @param df dataframe containing x,y-coordinates of player position in columns named \code{'x'} and \code{'y'}.
#' @param bins integer, the number of horizontal bins (length-wise) the soccer pitch is to be divided up into. If no value for \code{yBins} is provided, this value will also be used for the number of vertical (width-wise) bins.
#' @param yBins integer, the number of vertical bins (width-wise) the soccer patch is to be divided up into. If \code{NULL}, the same value is used as for \code{bins}.
#' @param lengthPitch,widthPitch numeric, length and width of pitch in metres.
#' @param heatmap if TRUE, draws a heatmap of player position underneath spokes with same number of bins as spokes 
#' @param colLow,colHigh character, colours for the low and high ends of the heatmap gradient, if heatmap argument is TRUE
#' @return a ggplot object of a heatmap on a soccer pitch.
#' @examples
#' \dontrun{
#' data(tromso)
#' # draw heatmap of player #9's position
#' soccerHeatmap(subset(tromso, id == 8), bins = 15)
#' }
#' @seealso \code{\link{soccerHeatmap}} for drawing just a heatmap of player position.
#' @export
soccerSpokes <- function(dat, bins, lengthPitch = 105, widthPitch = 68, yBins = NULL, heatmap = FALSE) {
  
  # check value for vertical bins and match to horizontal bins if NULL
  if(is.null(yBins)) yBins <- bins
  
  # adjust range and n bins
  bins <- 5
  x.range <- seq(0, lengthPitch, length.out = bins+1)
  y.range <- seq(0, widthPitch, length.out = yBins+1)
  
  # bin plot values
  x.bin.coords <- data.frame(x.bin = 1:bins, 
                             x.bin.coord = (x.range + (lengthPitch / (bins) / 2))[1:n])
  y.bin.coords <- data.frame(y.bin = 1:yBins,
                             y.bin.coord = (y.range + (widthPitch / (yBins) / 2))[1:yBins])
  
  # bin data
  dat <- dat %>%
    rowwise() %>%
    mutate(x.bin = max(which(x > x.range)),
           y.bin = max(which(y > y.range)),
           bin = paste(x.bin, y.bin, sep = "_")) %>%
    ungroup()
  
  # summarise values for each bin
  dat <- dat %>%
    group_by(bin) %>%
    select(id, bin, x.bin, y.bin, id, x, y, direction, speed) %>%
    mutate(x.mean = mean(x),
           y.mean = mean(y),
           angle.mean = mean(direction),
           speed.mean = mean(speed),
           n = n()) %>%
    ungroup()
  
  # add x,y-coords for bin centres
  dat <- left_join(dat, x.bin.coords, by = "x.bin")
  dat <- left_join(dat, y.bin.coords, by = "y.bin")
  
  # scale speed for geom_spoke arrow length
  dat$arrow.length <- 10 * (dat$speed.mean / max(dat$speed.mean)) + 3
  
  # plot
  p <- ggplot() +
    geom_point(data = dat, aes(x = x.bin.coord, y = y.bin.coord)) +
    geom_spoke(data = dat, aes(x = x.bin.coord, y = y.bin.coord, angle = angle.mean, radius = arrow.length), arrow=arrow(length = unit(0.2,"cm"))) +
    guides(fill=FALSE)
  
  if(heatmap) {
    p <- p +
      geom_bin2d(data = dat, aes(x, y), binwidth = c(diff(x.range)[1], diff(y.range)[1]), alpha = 0.8) +
      scale_fill_gradient(low = "white", high = "red")
  }

  soccerPitchFG(p, lengthPitch = lengthPitch, widthPitch = widthPitch)
}

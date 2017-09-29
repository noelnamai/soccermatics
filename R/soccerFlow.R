#' @include soccerFlow.R
NULL
#' Draws a flow field showing the direction of passes, shots, or movement made in each sector of the pitch.
#' Note: This function is still prototypical as there are no open-source pass event datasets to test with, but similar visualisations can be made with player movement direction instead.
#' 
#' @param df dataframe containing x,y-coordinates of player position in columns named \code{'x'} and \code{'y'}.
#' @param bins integer, the number of horizontal bins (length-wise) the soccer pitch is to be divided up into. If no value for \code{yBins} is provided, this value will also be used for the number of vertical (width-wise) bins.
#' @param lengthPitch,widthPitch numeric, length and width of pitch in metres.
#' @param yBins integer, the number of vertical bins (width-wise) the soccer patch is to be divided up into. If \code{NULL}, the same value is used as for \code{bins}
#' @param grass if TRUE, draws pitch background in green and lines in white. If FALSE, draws pitch background in white and lines in black.
#' @param plot optional, adds flow arrows to an existing ggplot object if provided
#' @return a ggplot object of a heatmap on a soccer pitch.
#' @examples
#' \dontrun{
#' data(tromso_extra)
#' # draw flow field showing mean direction of player #8's movement
#' soccerFlow(subset(tromso_extra, id == 8), bins = 5, grass = TRUE)
#' # draw flow field over player heatmap
#' p <- soccerHeatmap(subset(tromso_extra, id == 8), bins = 5)
#' soccerFlow(subset(tromso_extra, id == 8), bins = 5, plot = p)
#' }
#' @seealso \code{\link{soccerHeatmap}} for drawing just a heatmap of player position.
#' @export
soccerFlow <- function(df, bins, lengthPitch = 105, widthPitch = 68, yBins = NULL, grass = FALSE, plot = NULL) {
  
  # check value for vertical bins and match to horizontal bins if NULL
  if(is.null(yBins)) yBins <- bins

  # adjust range and n bins
  x.range <- seq(0, lengthPitch, length.out = bins+1)
  y.range <- seq(0, widthPitch, length.out = yBins+1)
  
  # bin plot values
  x.bin.coords <- data.frame(x.bin = 1:bins, 
                             x.bin.coord = (x.range + (lengthPitch / (bins) / 2))[1:bins])
  y.bin.coords <- data.frame(y.bin = 1:yBins,
                             y.bin.coord = (y.range + (widthPitch / (yBins) / 2))[1:yBins])

  # bin data
  df <- df %>%
    rowwise() %>%
    mutate(x.bin = max(which(x > x.range)),
           y.bin = max(which(y > y.range)),
           bin = paste(x.bin, y.bin, sep = "_")) %>%
    ungroup()
  
  # summarise values for each bin
  df <- df %>%
    group_by(bin) %>%
    select(id, bin, x.bin, y.bin, id, x, y, direction) %>%
    mutate(x.mean = mean(x),
           y.mean = mean(y),
           angle.mean = mean(direction),
           n = n()) %>%
    ungroup()
  
  # add x,y-coords for bin centres
  df <- left_join(df, x.bin.coords, by = "x.bin")
  df <- left_join(df, y.bin.coords, by = "y.bin")
  
  if(missing(plot)) {
    soccerPitchBG(lengthPitch = lengthPitch, widthPitch = widthPitch, grass = grass) +
      geom_point(data = df, aes(x = x.bin.coord, y = y.bin.coord)) +
      geom_spoke(data = df, aes(x = x.bin.coord, y = y.bin.coord, angle = angle.mean), radius = widthPitch / (yBins+2), arrow=arrow(length = unit(0.2,"cm"))) +
      guides(fill=FALSE)
  } else {
    plot +
      geom_point(data = df, aes(x = x.bin.coord, y = y.bin.coord)) +
      geom_spoke(data = df, aes(x = x.bin.coord, y = y.bin.coord, angle = angle.mean), radius = widthPitch / (yBins+2), arrow=arrow(length = unit(0.2,"cm"))) +
      guides(fill=FALSE)
  }
}

require(ggplot2)
require(ggforce)

# pitchFG()
#---------------------------------------------------------------------------
# Draws lines of football pitch on top of an existing plot by adding layers 
# with no fill
#----------------------------------------------------------------------------
# plot = a ggplot object to add layers to
# length = length of pitch in metres (m)
# width = width of pitch in metres (m)
#----------------------------------------------------------------------------

pitchFG <- function(plot, length = 105, width = 68) {
  plot +
    geom_rect(aes(xmin = -4, xmax = pitch_length + 4, ymin = -4, ymax = pitch_width + 4), fill = "NA") +
    # outer lines
    geom_rect(aes(xmin = 0, xmax = pitch_length, ymin = 0, ymax = pitch_width), fill = "NA", col = fg_col, lwd = 1.2) +
    # centre circle
    geom_circle(aes(x0 = pitch_length / 2, y0 = pitch_width / 2, r = 9.15), fill = "NA", col = fg_col, lwd = 1.2) +
    # kick off spot
    geom_circle(aes(x0 = pitch_length / 2, y0 = pitch_width / 2, r = 0.5), fill = fg_col, col = fg_col, lwd = 1.2) +
    # halfway line
    geom_segment(aes(x = pitch_length / 2, y = 0, xend = pitch_length / 2, yend = pitch_width), col = fg_col, lwd = 1.2) +
    # penalty areas
    geom_rect(aes(xmin = 0, xmax = 16.5, ymin = pitch_width / 2 - (40.3 / 2), ymax = pitch_width / 2 + (40.3 / 2)), fill = "NA", col = fg_col, lwd = 1.2) +
    geom_rect(aes(xmin = pitch_length - 16.5, xmax = pitch_length, ymin = pitch_width / 2 - (40.3 / 2), ymax = pitch_width / 2 + (40.3 / 2)), fill = "NA", col = fg_col, lwd = 1.2) +
    # penalty spots
    geom_circle(aes(x0 = 11, y0 = pitch_width / 2, r = 0.5), fill = fg_col, col = fg_col, lwd = 1.2) +
    geom_circle(aes(x0 = pitch_length - 11, y0 = pitch_width / 2, r = 0.5), fill = fg_col, col = fg_col, lwd = 1.2) +
    # penalty arcs
    geom_arc(aes(x0= 11, y0 = pitch_width / 2, r = 9.15, start = 0.65, end = 2.49), col = fg_col, lwd = 1.2) +
    geom_arc(aes(x0 = pitch_length - 11, y0 = pitch_width / 2, r = 9.15, start = 3.79, end = 5.63), col = fg_col, lwd = 1.2) +
    # six yard boxes
    geom_rect(aes(xmin = 0, xmax = 5.5, ymin = (pitch_width / 2) - 9.16, ymax = (pitch_width / 2) + 9.16), fill = "NA", col = fg_col, lwd = 1.2) +
    geom_rect(aes(xmin = pitch_length - 5.5, xmax = pitch_length, ymin = (pitch_width / 2) - 9.16, ymax = (pitch_width / 2) + 9.16), fill = "NA", col = fg_col, lwd = 1.2) +
    # goals
    geom_rect(aes(xmin = -2, xmax = 0, ymin = (pitch_width / 2) - 3.66, ymax = (pitch_width / 2) + 3.66), fill = "NA", col = fg_col, lwd = 1.2) +
    geom_rect(aes(xmin = pitch_length, xmax = pitch_length + 2, ymin = (pitch_width / 2) - 3.66, ymax = (pitch_width / 2) + 3.66), fill = "NA", col = fg_col, lwd = 1.2) +
    coord_fixed() +
    theme(rect = element_blank(), 
          line = element_blank(),
          text = element_blank())
}


# pitchBG()
#---------------------------------------------------------------------------
# Draws football pitch for purposes of plotting over
#----------------------------------------------------------------------------
# length = length of pitch in metres (m)
# width = width of pitch in metres (m)
# grass = boolean; if TRUE, draws pitch in green and lines in white
#----------------------------------------------------------------------------
pitchBG <- function(length = 105, width = 68, grass = FALSE) {
  # set draw colours
  if(grass) {
    bg_col = "#008000"
    fg_col = "white"
  } else {
    bg_col = "white"
    fg_col = "black"
  }
  
  #draw
  ggplot() +
    # pitch
    geom_rect(aes(xmin = -4, xmax = length + 4, ymin = -4, ymax = width + 4), fill = bg_col) +
    # outer lines
    geom_rect(aes(xmin = 0, xmax = length, ymin = 0, ymax = width), fill = bg_col, col = fg_col, lwd = 1.2) +
    # centre circle
    geom_circle(aes(x0 = length / 2, y0 = width / 2, r = 9.15), fill = bg_col, col = fg_col, lwd = 1.2) +
    # kick off spot
    geom_circle(aes(x0 = length / 2, y0 = width / 2, r = 0.5), fill = fg_col, col = fg_col, lwd = 1.2) +
    # halfway line
    geom_segment(aes(x = length / 2, y = 0, xend = length / 2, yend = width), col = fg_col, lwd = 1.2) +
    # penalty arcs
    geom_arc(aes(x0= 11, y0 = pitch_width / 2, r = 9.15, start = 0.65, end = 2.49), col= fg_col, lwd = 1.2) +
    geom_arc(aes(x0 = pitch_length - 11, y0 = pitch_width / 2, r = 9.15, start = 3.79, end = 5.63), col= fg_col, lwd = 1.2) +
    # penalty areas
    geom_rect(aes(xmin = 0, xmax = 16.5, ymin = width / 2 - (40.3 / 2), ymax = width / 2 + (40.3 / 2)), fill = bg_col, col = fg_col, lwd = 1.2) +
    geom_rect(aes(xmin = length - 16.5, xmax = length, ymin = width / 2 - (40.3 / 2), ymax = width / 2 + (40.3 / 2)), fill = bg_col, col = fg_col, lwd = 1.2) +
    # penalty spots
    geom_circle(aes(x0 = 11, y0 = width / 2, r = 0.5), fill = fg_col, col = fg_col, lwd = 1.2) +
    geom_circle(aes(x0 = length - 11, y0 = width / 2, r = 0.5), fill = fg_col, col = fg_col, lwd = 1.2) +
    # six yard boxes
    geom_rect(aes(xmin = 0, xmax = 5.5, ymin = (width / 2) - 9.16, ymax = (width / 2) + 9.16), fill = bg_col, col = fg_col, lwd = 1.2) +
    geom_rect(aes(xmin = length - 5.5, xmax = length, ymin = (width / 2) - 9.16, ymax = (width / 2) + 9.16), fill = bg_col, col = fg_col, lwd = 1.2) +
    # goals
    geom_rect(aes(xmin = -2, xmax = 0, ymin = (width / 2) - 3.66, ymax = (width / 2) + 3.66), fill = bg_col, col = fg_col, lwd = 1.2) +
    geom_rect(aes(xmin = length, xmax = length + 2, ymin = (width / 2) - 3.66, ymax = (width / 2) + 3.66), fill = bg_col, col = fg_col, lwd = 1.2) +
    coord_fixed() +
    theme(rect = element_blank(), 
          line = element_blank(),
          text = element_blank())
}

# drawDirectionOfPlay()
#---------------------------------------------------------------------------
# Adds arrow to show direction of play to top of existing pitch plot
#----------------------------------------------------------------------------
# direction = direction of arrow ('left', 'right')
# arrow_col = colour of arrow
# pitch_length = length of pitch in metres (m)
# pitch_width = width of pitch in metres (m)
# grass = boolean; if TRUE, draws pitch in green and lines in white
#----------------------------------------------------------------------------
drawDirectionOfPlay <- function(plot, direction = c("right", "left"), arrow_col = "black", pitch_length = 105, pitch_width = 68, grass = FALSE) {

  bg_col <- ifelse(grass, "#008000", "white")
  direction <- match.arg(direction)
  
  # plot
  p <- plot +
    geom_rect(aes(xmin = -4, xmax = pitch_length + 4, ymin = pitch_width + 4, ymax = pitch_width + 9), fill = bg_col)
  
  if(direction == "right") {
    p <- p + 
      geom_segment(aes(x = pitch_length * 1/4, xend = pitch_length * 3/4, y = pitch_width + 4.5, yend = pitch_width + 4.5), size = 3, arrow = arrow(angle=20, type="closed", ends="last", length=unit(1,"cm")), col = arrow_col)
  } else {
    p <- p + 
      geom_segment(aes(x = pitch_length * 3/4, xend = pitch_length * 1/4, y = pitch_width + 4.5, yend = pitch_width + 4.5), size = 3, arrow = arrow(angle=20, type="closed", ends="last", length=unit(1,"cm")), col = arrow_col)
  }
  
  p
}

# drawHeatmap()
#---------------------------------------------------------------------------
# Draw heatmap of player position over pitch outline
#----------------------------------------------------------------------------
# dataframe containing x,y-coordinates in columns named 'x' and 'y'
# bins = number of horizontal and vertical bins pitch is to be split up into
# pitch_length = length of pitch in metres (m)
# pitch_width = width of pitch in metres (m)
#----------------------------------------------------------------------------
drawHeatmap <- function(df, bins = 5, pitch_length = 105, pitch_width = 68) {
  # filter invalid values outside pitch limits
  df <- df[df$x > 0 & df$x < pitch_length & df$y > 0 & df$y < pitch_width,]
  
  # define bin ranges
  x.range <- seq(0, pitch_length, length.out = bins+1)
  y.range <- seq(0, pitch_width, length.out = bins+1)
  
  # plot
  p <- ggplot() +
    geom_bin2d(data = df, aes(x, y), binwidth = c(diff(x.range)[1], diff(y.range)[1])) +
    scale_fill_gradient(low = "white", high = "red") +
    guides(fill=FALSE)
  
  pitchFG(p, length = pitch_length, width = pitch_width)
}

# drawPositions()
#---------------------------------------------------------------------------
# Draws mean x,y-position of 
#----------------------------------------------------------------------------
# dataframe containing x,y-coordinates in columns named 'x' and 'y'
# id_var = name of column containing player identity
# pitch_length = length of pitch in metres (m)
# pitch_width = width of pitch in metres (m)
# col1 = fill colour of position points
# col2 = border colour of position points
# size = size of position points and text
# grass = boolean; if TRUE, fills pitch in green and draws lines in white
#----------------------------------------------------------------------------
drawPositions <- function(df, id_var = "id", pitch_length = 105, pitch_width = 68, col1 = "red", col2 = "white", size = 8, grass = FALSE) {
  # get average position of 11 players with most detected frames
  pos <- df %>%
    filter(x > 0 & x < pitch_length & y > 0 & y < pitch_width) %>%
    group_by_(id_var) %>%
    summarise(x.mean = mean(x), y.mean = mean(y), n = n()) %>%
    arrange(desc(n)) %>%
    head(11)
  
  if(arrow) {
    pitchBG(length = pitch_length, width = pitch_width, grass = grass, upper_space = T) +
      geom_point(data = pos, aes(x.mean, y.mean), shape = 21, size = size, fill = col1, colour = col2, stroke = 1.5) +
      geom_text(data = pos, aes(x.mean, y.mean, label=id), hjust=0.5, vjust=0.5, colour = col2, fontface = "bold", size = size - 4) +
      geom_segment(aes(x = pitch_length * 1/4, xend = pitch_length * 3/4, y = pitch_width + 4.5, yend = pitch_width + 4.5), size = 3, arrow=arrow(angle=20,type="closed",ends="last",length=unit(1,"cm")))
  } else {
    pitchBG(length = pitch_length, width = pitch_width, grass = grass) +
      geom_point(data = pos, aes(x.mean, y.mean), shape = 21, size = size, fill = col1, colour = col2, stroke = 1.5) +
      geom_text(data = pos, aes(x.mean, y.mean, label=id), hjust=0.5, vjust=0.5, colour = col2, fontface = "bold", size = size - 4)
  }
}

# Example #1: Add pitchlines to heatmap of player position frequency
#dat <- read.csv(url("http://home.ifi.uio.no/paalh/dataset/alfheim/2013-11-03/zxy/2013-11-03_tromso_stromsgodset_raw_first.csv"), head=F)
# #subset player #9
#dat <- subset(dat, id == 9)
# #set pitch length and width
#pitch_length <- 105
#pitch_width <- 68
# #filter only valid x,y-coords
#dat <- dat[dat$X > 0 & dat$X < pitch_length & dat$Y > 0 & dat$Y < pitch_width,]
# #draw heatmap plot and store
# #NOTE: Do not add data to first ggplot() line or performance issue will arise from each layer in pitchFG function calling data too
#p <- ggplot() +
#  geom_bin2d(data = dat, aes(X, Y), binwidth = c(pitch_length / 5, pitch_width/5), alpha= 0.5) +
#  scale_fill_gradient(low = "white", high = "red")
# #add pitch lines to plot
#pitchFG(p, length = pitch_length, width = pitch_width)

# Example #2: Plot real player position
#---------------------------------------
# #get sample dataset used in publication http://home.ifi.uio.no/paalh/publications/files/mmsys2014-dataset.pdf
#dat <- read.csv(url("http://home.ifi.uio.no/paalh/dataset/alfheim/2013-11-03/zxy/2013-11-03_tromso_stromsgodset_raw_first.csv"), head=F)
# #subset first minute (60 * 20 FPS) for player #9
#dat <- subset(dat, id == 9)[1:1200,]
# #draw pitch and add player path
#pitchBG() + geom_path(data = dat, aes(X, Y), lwd = 2)

# Example #3: Plot simulated correlated walk
#--------------------------------------------
# #simulate 1200 frames of x,y-coordinates using distributions fitted to real player position data ()
#dat <- simRun(1200, rho = 0.98, xlim = c(0,105), ylim = c(0,68), stat_pc = 0.11) 
# #set pitch length and width
#pitch_length <- 105
#pitch_width <- 68
# draw path on pitch
# #draw pitch and add player path
#pitchBG(length = pitch_length, width = pitch_width) + geom_path(data = dat, aes(X, Y), lwd = 2)
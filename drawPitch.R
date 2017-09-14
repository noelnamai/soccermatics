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
# bg_col = colour of pitch fill (keep as "NA" to retain visibility of previous plot)
# fg_col = colour of pitch lines
#----------------------------------------------------------------------------

pitchFG <- function(plot, length = 105, width = 68, bg_col = "NA", fg_col = "black") {
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
    geom_arc(aes(x0= 11, y0 = pitch_width / 2, r = 9.15, start = 0.65, end = 2.49), lwd = 1.2) +
    geom_arc(aes(x0 = pitch_length - 11, y0 = pitch_width / 2, r = 9.15, start = 3.79, end = 5.63), lwd = 1.2) +
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
# Draws lines of football pitch on top of an existing plot by adding layers 
# with no fill
#----------------------------------------------------------------------------
# length = length of pitch in metres (m)
# width = width of pitch in metres (m)
# bg_col = colour of pitch fill
# fg_col = colour of pitch lines
#----------------------------------------------------------------------------
pitchBG <- function(length = 105, width = 68, bg_col = "#008000", fg_col = "#FFFFFF") {
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
    geom_circle(aes(x0 = 11, y0 = width / 2, r = 9.15), fill = bg_col, col = fg_col, lwd = 1.2) +
    geom_circle(aes(x0 = length - 11, y0 = width / 2, r = 9.15), fill = bg_col, col = fg_col, lwd = 1.2) +
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
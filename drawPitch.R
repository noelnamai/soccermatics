require(ggplot2)
require(ggforce)

# drawPitch()
#---------------------------------------------------------------------------
# Draw football (soccer) pitch with user-defined pitch length and width using 
# ggplot. Uses function `ggforce::geom_circle`.
#----------------------------------------------------------------------------
# length = length of pitch in metres (m)
# width = width of pitch in metres (m)
# bg_col = colour of background
# fg_col = colour of foreground lines
#----------------------------------------------------------------------------

drawPitch <- function(length = 105, width = 68, bg_col = "#008000", fg_col = "#FFFFFF") {
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

# Example #1: Plot real player position
#---------------------------------------
# #get sample dataset used in publication http://home.ifi.uio.no/paalh/publications/files/mmsys2014-dataset.pdf
#dat <- read.csv(url("http://home.ifi.uio.no/paalh/dataset/alfheim/2013-11-03/zxy/2013-11-03_tromso_stromsgodset_raw_first.csv"), head=F)
# #subset first minute (60 * 20 FPS) for player #9
#dat <- subset(dat, id == 9)[1:1200,]
# #draw path on pitch
#pitch <- drawPitch(length = 105, width = 68)
#pitch + geom_path(data = dat, aes(X, Y), lwd = 2)

# Example #2: Plot simulated correlated walk
#--------------------------------------------
# #simulate 1200 frames of x,y-coordinates using distributions fitted to real player position data ()
#dat <- simRun(1200, rho = 0.98, xlim = c(0,105), ylim = c(0,68), stat_pc = 0.11) 
# draw path on pitch
#pitch <- drawPitch(length = 105, width = 68)
#pitch + geom_path(data = dat, aes(x = X, y = Y), lwd = 2)

# Example #3: Plot heatmap of player position frequency
#dat <- read.csv(url("http://home.ifi.uio.no/paalh/dataset/alfheim/2013-11-03/zxy/2013-11-03_tromso_stromsgodset_raw_first.csv"), head=F)
# #subset player #9
#dat <- subset(dat, id == 9)
# #filter only valid x,y-coords
#dat <- dat[dat$X > 0 & dat$X < 105 & dat$Y > 0 & dat$Y < 68,]
# #draw heatmap on pitch with white background
#pitch <- drawPitch(bg_col = "white", fg_col = "black")
#pitch + geom_bin2d(data = dat, aes(X, Y), alpha= 0.5, bins = 5)
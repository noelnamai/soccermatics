#' x,y-coordinates of 11 soccer players over 10 minutes (12000 frames each)
#'
#' Data on movements of 11 soccer players (1'-10'; Tromsø IL vs. Anzhi, 2013-11-07), captured at 20 Hz using the ZXY Sport Tracking system and made available in the publication \href{http://home.ifi.uio.no/paalh/dataset/alfheim/}{ZXY Sport Tracking}.
#' @docType data
#' @name data-tromso
#' @format A dataframe containing 12000 frames of x,y-coordinates and timestamps from 11 players.
#' @source \href{http://home.ifi.uio.no/paalh/dataset/alfheim/}{ZXY Sport Tracking}
#' @references Pettersen et al. (2014) Proceedings of the International Conference on Multimedia Systems (MMSys)
#' (\href{http://home.ifi.uio.no/paalh/publications/files/mmsys2014-dataset.pdf}{pdf})
#' @usage data(tromso)
#' @examples
#' \dontrun{
#' data(tromso)
#' # draw path of player #8 on a soccer pitch
#' soccerPitchBG(lengthPitch = 105, widthPitch = 68, grass = TRUE) + 
#'   geom_path(data = subset(tromso, id == 8), aes(x, y), lwd = 2)
#' }
NULL

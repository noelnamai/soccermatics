## Draw football pitch in ggplot
Draws a football pitch using ggplot for overlaying positional statistics, movement trajectories, etc. For example (data obtained using [this script](https://github.com/JoGall/simulated-walks/blob/master/fitFootballRun.R)):

<img src="https://user-images.githubusercontent.com/17113779/30368517-48f38bde-9869-11e7-8cc2-4ce888136e13.png" width="500">

## Pitch dimensions
Many repositories provide relative x,y-coordinates in their positional statistics (e.g. pass location, shot location), using a scale of 0-100 for pitch length and width. The exact pitch dimensions (i.e. in metres) are therefore needed to determine the true value (e.g. pass length, shot distance).

Pitch dimensions of all Premier League teams as listed on Wikipedia are available in the [pitch_dimensions.csv](https://github.com/JoGall/football-stats/blob/master/pitch_dimensions.csv) file. In most cases, pitch length and width is listed in both metres and yards, but a conversion has been used where only one unit of measurement has been provided. EPL teams are up-to-date as of the 2016-17 season; the FDCOUK column contains the names of the teams as they appear in data from http://football-data.co.uk. I'd like to expand this list with additional teams from other European leagues at some point, but welcome anyone to expand the list themselves in the meantime.

A CSV containing latitude and longitude for 160 European teams is also available [here](http://opisthokonta.net/wp-content/uploads/2015/03/stadiums_20150302.csv) courtesy of opisthokonta.net.

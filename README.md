## Sample visualisations

<img src="https://user-images.githubusercontent.com/17113779/30522413-71806bce-9bc7-11e7-9e48-50e77ced3865.png" width="500">

**Figure 1.** Player heatmap over 90 minutes (player #9; Tromsø IL vs. Strømsgodset, 2013-11-03). Arrow shows direction of play.

<img src="https://user-images.githubusercontent.com/17113779/30522404-43106fc8-9bc7-11e7-8f7a-4146aef7bcdc.png" width="500">

**Figure 2.** Average position of each player (Tromsø IL vs. Strømsgodset, 2013-11-03). Arrow shows direction of play.

<img src="https://user-images.githubusercontent.com/17113779/30522405-4311a35c-9bc7-11e7-8d16-a5d5efe154e6.png" width="500">

**Figure 3.** Flow visualisation showing average player movement in different areas of the pitch (player #9; Tromsø IL vs. Strømsgodset, 2013-11-03).

<img src="https://user-images.githubusercontent.com/17113779/30522406-43193482-9bc7-11e7-9d67-d7e9e8329513.png" width="500">

**Figure 4.** 'Wagon wheel' visualisation showing direction of events in different areas of the pitch (player #9; Tromsø IL vs. Strømsgodset, 2013-11-03). This figure uses a random sample of player movement, but this method is intended to visualise pass or shot event data which are not yet publicly available.


## Pitch dimensions
Many repositories provide relative x,y-coordinates in their positional statistics (e.g. pass location, shot location), using a scale of 0-100 for pitch length and width. The exact pitch dimensions (i.e. in metres) are therefore needed to determine the true value (e.g. pass length, shot distance).

Pitch dimensions of all Premier League teams as listed on Wikipedia are available in the [pitch_dimensions.csv](https://github.com/JoGall/football-stats/blob/master/pitch_dimensions.csv) file. In most cases, pitch length and width is listed in both metres and yards, but a conversion has been used where only one unit of measurement has been provided. EPL teams are up-to-date as of the 2016-17 season; the FDCOUK column contains the names of the teams as they appear in data from http://football-data.co.uk. I'd like to expand this list with additional teams from other European leagues at some point, but welcome anyone to expand the list themselves in the meantime.

A CSV containing latitude and longitude for 160 European teams is also available [here](http://opisthokonta.net/wp-content/uploads/2015/03/stadiums_20150302.csv) courtesy of opisthokonta.net.

#' Gather Matchup Data in a League for a Week
#'
#' Given a league ID and week number, grab the matchup data, including player points, total points,
#' starting rosters, and more.
#'
#' @return Returns a data frame containing information about the matchups.
#' @author Nick Bultman, \email{njbultman74@@gmail.com}, September 2021
#' @keywords matchups league
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' get_matchups(688281863499907072, 2)
#' get_matchups(688281863499907072, 1)
#'
#' @param league_id League ID generated by Sleeper (integer)
#' @param week Matchup week (integer)
#'
get_matchups <- function(league_id, week) {
  return(fromJSON(content(GET(paste0("https://api.sleeper.app/v1/league/", league_id, "/matchups/", week)), as = "text")))
}


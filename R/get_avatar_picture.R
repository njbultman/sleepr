#' Display Avatar
#'
#' Given an avatar ID, grab the picture (full or thumbnail) concerning that particular avatar.
#' Note that this function temporarily downloads the image into your temporary directory to display 
#' it. Then, the function deletes the file before completing.
#'
#' @return Returns a picture displaying the avatar picture
#' @author Nick Bultman, \email{njbultman74@@gmail.com}, October 2021
#' @keywords avatar picture
#' @export
#' @examples
#' get_avatar_picture("c751b27d9158c1dd41bd33dc7e4bcdde", type = "full")
#'
#' @param user_id Avatar ID generated by Sleeper (string)
#'
get_avatar_picture <- function(avatar_id, type = "full") {
  temp_fil <- paste0(tempfile(), ".png")
  if(type == "full") {
    download.file(paste0("https://sleepercdn.com/avatars/", avatar_id), destfile = temp_fil)
    file.show(temp_fil)
    invisible(file.remove(temp_fil))
  }
  else if(type == "thumbnail") {
    download.file(paste0("https://sleepercdn.com/avatars/thumbs/", avatar_id), destfile = temp_fil)
    file.show(temp_fil)
    invisible(file.remove(temp_fil))
  }
  else{
    stop("Invalid value entered for type: can only be 'full' or 'thumbnail'")
  }
}
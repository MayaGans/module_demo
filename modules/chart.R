
chart <- function(input, output, session) {
  p <- ggplot(datafile(), aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
  return(p)
}
button <- function(id, img) {
  HTML(str_c('
    <button id="', id, '" type="button" class="btn btn-default action-button shiny-bound-input">
      <img src="img/', img, '.png" />
    </button>
  '))
}
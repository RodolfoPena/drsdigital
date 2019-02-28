$(document).on('turbolinks:load', function() {
  $(function () {
    $('[data-toggle="offcanvas"]').on('click', function () {
      $('.offcanvas-collapse').toggleClass('open')
    })
  })
})

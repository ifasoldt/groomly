Tickets = {

  show: function(sidebarHtml, ticketId) {
    debugger
    $('.selected').removeClass('selected')
    $(`#ticket-${ticketId}`).addClass('selected')
    $('.right-box').html(sidebarHtml)
  }
}

Tickets = {

  show: function(sidebarHtml, ticketId, voteCardHtml) {
    $('.selected').removeClass('selected')
    $(`#ticket-${ticketId}`).addClass('selected')
    $('.right-box').html(sidebarHtml)
    $('.vote-cards').replaceWith(voteCardHtml)
  }
}

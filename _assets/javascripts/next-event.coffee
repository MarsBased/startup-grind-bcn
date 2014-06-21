'use strict'

$().ready ->
  if $('#eventbrite-tickets').length
    Eventbrite(app_key: "EE7I6V2SJMFENPWOO3", (eb)->
      eb.organizer_list_events(
        id: 6237922927, only_display: 'status', (response) ->
          event = _.find(response.events, (e)->
            e.event.status == 'Live' || e.event.status == 'Started'
          )
          if event
            $('#eventbrite-event-title').html(event.event.title)
            $('#eventbrite-tickets').html(eb.widget.ticket(event.event))
          else
            $('#eventbrite-event-title').html("No events planned. Stay tunned!")
      )
    )
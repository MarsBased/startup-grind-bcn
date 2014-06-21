'use strict'

getLastEvent = (callback)->
  Eventbrite(app_key: "EE7I6V2SJMFENPWOO3", (eb)->
    eb.organizer_list_events(
      id: 6237922927, only_display: 'status', (response) ->
        event = _.find(response.events, (e)->
          e.event.status == 'Live' || e.event.status == 'Started'
        )
        event = event.event if event
        eval(callback(eb, event))
    )
  )

$().ready ->
  if $('#eventbrite-tickets').length
    getLastEvent (eb, event)->
      if event
        $('#eventbrite-event-title').html(event.title)
        $('#eventbrite-tickets').html(eb.widget.ticket(event))
      else
        $('#eventbrite-event-title').html("No events planned. Stay tunned!")
  else if $('#next-event-link').length
    getLastEvent (eb, event)->
      if event
        $('#next-event-link').html(eb.widget.link(
          event, 'Join us in our next event!', 'white'))
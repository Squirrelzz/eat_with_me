class FeedMe
  constructor: ->
    $('.draggable').draggable(helper: "clone")
    $('.droppable').droppable(drop: @drop)

  drop: (event, ui) ->
    $.ajax
      url: '/feeds'
      type: 'post'
      dataType: 'json'
      data: {
        feed: {
          meal_id: ui.draggable.data("mealId")
          pet_id: ui.draggable.data("petId")
        }
      }
      success: (data) ->
        $("#health_icon").attr("src", data.health_icon)
        $("#health_index").html(data.health_index)
        $("#coins").html(data.coins)
      error: (xhr, status, error) ->
        debugger

window.FeedMe = FeedMe

class FeedMe
  constructor: ->
    $('.draggable').draggable(revert: "invalid")
    $('.droppable').droppable(drop: @drop)

  drop: (event, ui) =>
    feed =
      feed:
        meal_id: ui.draggable.data("mealId")
        pet_id: ui.draggable.data("petId")

    ui.draggable.remove()

    $.ajax
      url: '/feeds'
      type: 'post'
      dataType: 'json'
      data: feed

      success: (data) =>
        $("#health_icon").attr("src", data.health_icon)
        $("#health_index").html(data.health_index)
        $("#coins").html(data.coins)
        $("#food-name").html(data.meal_name)
        $("#myModal").foundation("reveal", "open")

      error: (xhr, status, error) ->

window.FeedMe = FeedMe

class FeedMe
  constructor: ->
    $('.draggable').draggable(revert: "invalid")
    $('.droppable').droppable
      activeClass: "open"
      drop: @drop
      activate: @activate
      deactivate: @deactivate

  activate: (event, ui) =>
    $ele = $(event.target)
    $ele.attr('src', $ele.data("open"))
  deactivate: (event, ui) =>
    $ele = $(event.target)
    $ele.attr('src', $ele.data("closed"))

  drop: (event, ui) =>
    @deactivate(event, ui)
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
        $("#coins").html(data.coins)
        $("#food-name").html(data.meal_name)
        $("#myModal").foundation("reveal", "open")
        positionTick(data.health_index)

      error: (xhr, status, error) ->

window.FeedMe = FeedMe

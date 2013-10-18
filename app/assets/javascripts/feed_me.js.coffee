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
    Foundation.libs.reveal.settings.animation = 'fade'

    @deactivate(event, ui)
    $(".tooltip").hide()

    items_pet =
      items_pet:
        children_item_id: ui.draggable.data("childrenItemId")
        pet_id: ui.draggable.data("petId")

    ui.draggable.remove()

    $.ajax
      url: '/items_pets'
      type: 'post'
      dataType: 'json'
      data: items_pet

      success: (data) =>
        $("#health_icon").attr("src", data.health_icon)
        $("#coins").html(data.coins)
        $("#food-name").html(data.item_name)
        $("#food-name-1").html(data.item_name)
        $("#food-healthy").html(data.how_healthy)
        $("#food-value").html(data.value)
        $("#feeling").html(data.feeling)
        $("#happiness").attr('src', data.happiness)
        $("#pet-image").attr('src', data.pet_image)
        $("#justFed").foundation("reveal", "open")
        positionTick(data.health_index)

      error: (xhr, status, error) ->

window.FeedMe = FeedMe

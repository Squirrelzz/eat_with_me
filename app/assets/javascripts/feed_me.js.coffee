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
    feed =
      feed:
        meals_person_id: ui.draggable.data("mealsPersonId")
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
        $("#justFed").foundation("reveal", "open")
        $("#food-name").html(data.meal_name)
        $("#food-name-1").html(data.meal_name)
        $("#food-healthy").html(data.how_healthy)
        $("#food-value").html(data.value)
        $("#feeling").html(data.feeling)
        $("#happiness").attr('src', data.happiness)
        $("#pet-image").attr('src', "/images/#{data.pet_image}")
        positionTick(data.health_index)

      error: (xhr, status, error) ->

window.FeedMe = FeedMe

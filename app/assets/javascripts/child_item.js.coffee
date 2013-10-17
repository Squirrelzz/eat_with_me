class ChildItem
  constructor: ($elements) ->
    $elements.each (i, element) =>
      $element = $(element)
      $element.on('click', @createChildItem)

  createChildItem: (event) =>
    item = $(event.target)
    item = $(event.target).parent('.item') unless item.hasClass("item")

    $.ajax
      url: '/children_items'
      type: 'post'
      dataType: 'json'
      data:
        children_item:
          item_id: item.data('itemId')
          user_id: item.data('userId')

      success: (data) =>
        id = "#item_#{data.item_id}_child_#{data.user_id}"
        $ele = $(id)
        $ele.parent('.item').addClass("selected")

        span = $("<span/>").addClass("tag").text(data.item_name + " ")
        circle = $("<span/>").addClass("circle").addClass(data.qualification)
        $("#log").append(span.append(circle))

window.ChildItem = ChildItem

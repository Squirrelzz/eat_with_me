class ChildItem
  constructor: ($elements) ->
    $elements.each (i, element) =>
      $element = $(element)
      $element.on('click', @createChildItem)

  createChildItem: (event) =>
    item = $(event.target).parent('.item')
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
        $("#log").append($("<li></li>").text(data.item_name))

window.ChildItem = ChildItem

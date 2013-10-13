class MealPerson
  constructor: ($elements) ->
    $elements.each (i, element) =>
      $element = $(element)
      $element.on('click', @createMealPerson)

  createMealPerson: (event) =>
    meal = $(event.target).parent('.meal')
    $.ajax
      url: '/meals_people'
      type: 'post'
      dataType: 'json'
      data:
        meals_person:
          meal_id: meal.data('mealId')
          person_id: meal.data('personId')

      success: (data) =>
        id = "#meal_#{data.meal_id}_person_#{data.person_id}"
        $ele = $(id)
        $ele.html("[OK]")

      error: =>
        debugger

window.MealPerson = MealPerson

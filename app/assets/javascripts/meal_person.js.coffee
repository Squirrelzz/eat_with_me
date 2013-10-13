class MealPerson
  constructor: ($elements) ->
    $elements.each (i, element) =>
      $element = $(element)
      $element.on('click', @createMealPerson)

  createMealPerson: (event) =>
    meal = $(event.target).parent('.meal')
    console.log meal

window.MealPerson = MealPerson

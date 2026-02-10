puts "Seeding database..."

# Tags
italian = Tag.find_or_create_by!(name: "Italian")
quick = Tag.find_or_create_by!(name: "Quick")
vegetarian = Tag.find_or_create_by!(name: "Vegetarian")
breakfast = Tag.find_or_create_by!(name: "Breakfast")

# Recipe 1: Spaghetti Aglio e Olio
aglio = Recipe.create!(
  title: "Spaghetti Aglio e Olio",
  description: "A classic Roman pasta with garlic and olive oil.",
  servings: 4,
  prep_time_minutes: 5,
  cook_time_minutes: 15,
  ingredients_attributes: [
    { name: "spaghetti", quantity: "1", unit: "lb" },
    { name: "garlic cloves", quantity: "6", unit: "cloves" },
    { name: "extra virgin olive oil", quantity: "1/2", unit: "cup" },
    { name: "red pepper flakes", quantity: "1/2", unit: "tsp" },
    { name: "fresh parsley", quantity: "1/4", unit: "cup" }
  ],
  steps_attributes: [
    { position: 1, instruction: "Cook spaghetti in salted boiling water until al dente. Reserve 1 cup pasta water before draining." },
    { position: 2, instruction: "Thinly slice the garlic. Heat olive oil in a large skillet over medium heat." },
    { position: 3, instruction: "Add garlic and red pepper flakes, cook until garlic is golden (about 2 minutes)." },
    { position: 4, instruction: "Add drained pasta and a splash of pasta water. Toss to coat." },
    { position: 5, instruction: "Garnish with fresh parsley and serve immediately." }
  ]
)
aglio.tags << [italian, quick, vegetarian]

# Recipe 2: Fluffy Pancakes
pancakes = Recipe.create!(
  title: "Fluffy Pancakes",
  description: "Light and fluffy buttermilk pancakes, perfect for weekend mornings.",
  servings: 4,
  prep_time_minutes: 10,
  cook_time_minutes: 15,
  ingredients_attributes: [
    { name: "all-purpose flour", quantity: "1.5", unit: "cups" },
    { name: "buttermilk", quantity: "1.25", unit: "cups" },
    { name: "egg", quantity: "1", unit: "" },
    { name: "butter (melted)", quantity: "3", unit: "tbsp" },
    { name: "sugar", quantity: "2", unit: "tbsp" },
    { name: "baking powder", quantity: "1.5", unit: "tsp" },
    { name: "salt", quantity: "1/2", unit: "tsp" }
  ],
  steps_attributes: [
    { position: 1, instruction: "Mix flour, sugar, baking powder, and salt in a large bowl." },
    { position: 2, instruction: "Whisk buttermilk, egg, and melted butter in a separate bowl." },
    { position: 3, instruction: "Pour wet ingredients into dry and stir until just combined (lumps are fine)." },
    { position: 4, instruction: "Heat a buttered griddle over medium heat. Pour 1/4 cup batter per pancake." },
    { position: 5, instruction: "Cook until bubbles form on surface, then flip. Cook another 1-2 minutes." }
  ]
)
pancakes.tags << [breakfast, vegetarian]

# Recipe 3: Caprese Salad
caprese = Recipe.create!(
  title: "Caprese Salad",
  description: "Simple Italian salad with fresh mozzarella, tomatoes, and basil.",
  servings: 2,
  prep_time_minutes: 10,
  cook_time_minutes: 0,
  ingredients_attributes: [
    { name: "fresh mozzarella", quantity: "8", unit: "oz" },
    { name: "ripe tomatoes", quantity: "2", unit: "large" },
    { name: "fresh basil leaves", quantity: "8", unit: "leaves" },
    { name: "extra virgin olive oil", quantity: "2", unit: "tbsp" },
    { name: "balsamic glaze", quantity: "1", unit: "tbsp" }
  ],
  steps_attributes: [
    { position: 1, instruction: "Slice mozzarella and tomatoes into 1/4-inch thick rounds." },
    { position: 2, instruction: "Arrange alternating slices of tomato and mozzarella on a plate." },
    { position: 3, instruction: "Tuck basil leaves between slices. Drizzle with olive oil and balsamic glaze." }
  ]
)
caprese.tags << [italian, quick, vegetarian]

puts "Seeded #{Recipe.count} recipes, #{Tag.count} tags."

module SavesHelper
  def extractBestProductPriceByCategory(store, category)
    product = Product.where(:store_id => store.id, :category_id => category.category.id)
                     .order(unit_price: :asc)
                     .first
  end
  
  def extractBestProductPriceByDescription(store, category)
    product = Product.where(:store_id => store.id, :category_id => category.category.id, :description_id => category.description.id)
                     .order(unit_price: :asc)
                     .first
  end
  
  def findBestPriceByCategory(store, category, store_array, category_idx, store_idx)
    product = extractBestProductPriceByCategory(store, category)
    puts "\t\tBest price for product #{product.description.description} #{product.provider.name} is in store : #{store.name} at #{product.price}"
    store_array[store_idx][category_idx] = product.price.to_f / 100
  end
  
  def findBestPriceBySubCategory(store, category, store_array, category_idx, store_idx)
    product = extractBestProductPriceByDescription(store, category)
    puts "\t\tBest price for #{category.category.name}->#{product.description.description}->#{product.provider.name} is in store : #{store.name} at #{product.price}" 
    store_array[store_idx][0] = product.store.id
    store_array[store_idx][category_idx] = product.price.to_f / 100
  end
  
  def build_html_table( category_array , store_array , best_store)
    store_id = best_store.id
    store_name = best_store.name
    best_price_link = %Q[<a class="btn btn-primary" href="/details?store_id=#{store_id}">#{store_name}</a>]
    id = %q["myTable"]
    table = %Q[<table class="table table-hover" id=#{id}>]
    table += %Q[<thead class=thead-inverse><tr><th></th><th>#{best_price_link}</th><th>Maxi</th><th>Metro Plus</th></tr></thead><tbody>]
    for i in 1..category_array.size
      if (i < category_array.size)
        categorie = category_array[i]
        categorie_translate = I18n.t(categorie)
        table += "<tr><td>#{categorie_translate}</td>"
      else
        table += "<tr><td>Total</td>"
      end
      for j in 0..(store_array.size - 1)
        table += "<td>#{store_array[j][i]}</td>"
      end
      table += "</tr>"
    end
    table += "</tbody></table>"
  end
  
  def say_hello
    "Hello"
  end
  
  def show_best_stores
    first_list = List.first
    puts "Processing list # " + first_list.id.to_s + " (Best Price By Store / Category / SubCategory)"
    
    user = first_list.user
    #puts "The user associated with that first list is : " + user.name
    
    categories = ListCategory.where(list_id: first_list.id)
    num_of_stores = 3
    num_of_categories = categories.count
    #puts "Number of categories = #{num_of_categories}"
    
    category_idx = 1
    store_idx = 0
    category_array = Array.new(categories.size)
    store_array = Array.new(num_of_stores) { Array.new(categories.size + 2, 0) }
    
    stores = Store.all
    categories.each do |category|
      category_array[category_idx] = category.category.name
      store_idx = 0
      stores.each do |store|
        #findBestPriceByCategory(store, category, store_array, category_idx, store_idx)
        findBestPriceBySubCategory(store, category, store_array, category_idx, store_idx)
        store_idx += 1
      end
      category_idx += 1
    end
    
    # print the category
    p category_array
    
    # Calculating the sum for each store
#    store_array.each do |row|
#      row[-1] = row.inject(0, :+)
#    end
    
    i = 0
    j = 1
    until i >= 2
      sum = 0
      until j >= category_array.length - 1
        sum += store_array[i][j]
        j = j + 1
      end
      store_array[i][-1] = sum
      i = i + 1
    end
    
    # Sorting by the last element ascending order
    store_array.sort_by!(&:last)

    # I need to find the best store.id
    #best_store = Store.find(2)
    best_store = Store.find(store_array[0][0])
    
    html = build_html_table( category_array , store_array , best_store).html_safe
  end
end

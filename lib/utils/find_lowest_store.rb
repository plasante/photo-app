module FindLowestPrice
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
    store_array[store_idx][category_idx] = product.price.to_f / 100
  end
  
  def build_html_table( category_array , store_array )
    id = %q["myTable"]
    table = %Q[<table id=#{id}>]
    table += "<tr><th></th><th>IGA EXTRA</th><th>Maxi></th><th>Metro Plus</th></tr>"
    for i in 0..category_array.size
      table += "<tr><td>#{category_array[i]}</td>"
      for j in 0..(store_array.size - 1)
        table += "<td>#{store_array[j][i]}</td>"
      end
      table += "</tr>"
    end
    table += "</table>"
  end
  
  def self.save
    first_list = List.first
    puts "Processing list # " + first_list.id.to_s + " (Best Price By Store / Category / SubCategory)"
    
    user = first_list.user
    puts "The user associated with that first list is : " + user.name
    
    categories = ListCategory.where(list_id: first_list.id)
    num_of_stores = 3
    num_of_categories = categories.count
    puts "Number of categories = #{num_of_categories}"
    
    category_idx = 0
    store_idx = 0
    category_array = Array.new(categories.size)
    store_array = Array.new(num_of_stores) { Array.new(categories.size + 1, 0) }
    
    stores = Store.all
    categories.each do |category|
      category_array[category_idx] = category.category.name
      puts "Category = " + category.category.name
      store_idx = 0
      stores.each do |store|
        #findBestPriceByCategory(store, category, store_array, category_idx, store_idx)
        findBestPriceBySubCategory(store, category, store_array, category_idx, store_idx)
        store_idx += 1
      end
      category_idx += 1
    end
    
    p category_array
    # Calculating the sum for each store
    store_array.each do |row|
      row[-1] = row.inject(0, :+)
    end
    # Sorting by the last element ascending order
    store_array.sort_by!(&:last)
    pp store_array
    
    html = build_html_table( category_array , store_array )
  end
end
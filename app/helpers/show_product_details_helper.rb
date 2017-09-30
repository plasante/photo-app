module ShowProductDetailsHelper
  
  def extractBestProductPriceByDescription2(store, category)
    product = Product.where(:store_id => store.id, :category_id => category.category.id, :description_id => category.description.id)
                     .order(unit_price: :asc)
                     .first
  end
  
  def findPriceBySubCategory2(store, category, price_array, category_array, category_idx)
    product = extractBestProductPriceByDescription2(store, category)
    price_array[category_idx] = product.price.to_f / 100
    category_array[category_idx] = product.description.description + " (" + product.provider.name + ")"
  end
  
  def build_html_table2( category_array , price_array , store )
    store_address = store.name + " (" + store.address.number + " " + store.address.street + ", " + store.address.city.name + ")"
    id = %q["myTable"]
    table = %Q[<table class="table table-hover" id=#{id}>]
    table += "<thead class=thead-inverse><tr><th></th><th>#{store_address}</th></tr></thead><tbody>"
    for i in 0..category_array.size
      if (i < category_array.size)
        categorie = category_array[i]
        categorie_translate = I18n.t(categorie)
        table += "<tr><td>#{categorie}</td>"
      else
        table += "<tr><td>Total</td>"
      end
      table += "<td>#{price_array[i]}</td></tr>"
    end
    table += "</tbody></table>"
  end

  
  def show_best_store_product_details(store_id)
    
    store = Store.find(store_id)
    first_list = List.first
    categories = ListCategory.where(list_id: first_list.id)
    
    category_array = Array.new(categories.size)
    price_array = Array.new(categories.size + 1, 0) 
    category_idx = 0
    
    categories.each do |category|
      findPriceBySubCategory2(store, category, price_array, category_array, category_idx)
      category_idx += 1
    end
    
    # summing the price_array
    price_array[-1] = price_array.inject(0){|sum,x| sum + x }
    
    html = build_html_table2( category_array , price_array, store ).html_safe
    #p html
  end
end

#show_best_store_product_details(2)

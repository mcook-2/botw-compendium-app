class SearchController < ApplicationController
  def index
    query = params[:query]&.downcase
    category = params[:category] || "all"
    sort = params[:sort] || "name"
    per_page = params[:per_page] == "all" ? nil : (params[:per_page] || 10).to_i
    page = params[:page] || 1

    if query.present?
      @results = case category
                 when "creatures"
                   Creature.where('LOWER(name) LIKE ?', "%#{query}%")
                 when "monsters"
                   Monster.where('LOWER(name) LIKE ?', "%#{query}%")
                 when "materials"
                   Material.where('LOWER(name) LIKE ?', "%#{query}%")
                 when "equipment"
                   Equipment.where('LOWER(name) LIKE ?', "%#{query}%")
                 when "treasures"
                   Treasure.where('LOWER(name) LIKE ?', "%#{query}%")
                 else
                   combine_all_categories(query)
                 end
    else
      @results = case category
                 when "creatures"
                   Creature.all
                 when "monsters"
                   Monster.all
                 when "materials"
                   Material.all
                 when "equipment"
                   Equipment.all
                 when "treasures"
                   Treasure.all
                 else
                   combine_all_categories
                 end
    end

    @results = if sort == "id"
                 @results.sort_by(&:id)
               else
                 @results.sort_by { |result| result.send(sort).to_s.downcase rescue "" }
               end
    @results = Kaminari.paginate_array(@results).page(page).per(per_page)
  end

  private

  def combine_all_categories(query = nil)
    monsters = query ? Monster.where('LOWER(name) LIKE ?', "%#{query}%") : Monster.all
    creatures = query ? Creature.where('LOWER(name) LIKE ?', "%#{query}%") : Creature.all
    materials = query ? Material.where('LOWER(name) LIKE ?', "%#{query}%") : Material.all
    equipment = query ? Equipment.where('LOWER(name) LIKE ?', "%#{query}%") : Equipment.all
    treasures = query ? Treasure.where('LOWER(name) LIKE ?', "%#{query}%") : Treasure.all

    monsters + creatures + materials + equipment + treasures
  end
end

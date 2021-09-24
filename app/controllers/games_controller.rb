class GamesController < ApplicationController
  def index
  end
  
  def gacha
  end
  
  def get_gacha
    use_point = 1
    point = Profile.find_by(user_id: current_user.id).point
    if point >= use_point
      items = ItemMaster.where(gacha: true)
      random = rand(100)
      if random <= 4
        items = items.where(rare: 5)
      elsif random <=14
        items = items.where(rare: 4)
      elsif random <= 24
        items = items.where(rare: 0)
      else
        items = items.where(rare: 3)
      end
      item = items.sample
      
      if UserItem.find_by(user_id: current_user.id, item_master_id: item.id)
        user_item = UserItem.find_by(user_id: current_user.id, item_master_id: item.id)
        new_num = user_item.num + 1
        user_item.update(num: new_num)
      else
        user_item = current_user.user_items.build(item_master_id: item.id, num: 1)
        user_item.save
      end
      
      profile = Profile.find_by(user_id: current_user.id)
      new_point = point - use_point
      profile.update(point: new_point)
      
      @result = ItemMaster.find(item.id).name + 'をGET！'
    else
      @result = 'ポイントが足りません！'
    end
  end
  
  def list
    @all_items = ItemMaster.all
    @got_items = current_user.items
  end
  
  def have
    @items = current_user.items
    @num = current_user.user_items
  end
end

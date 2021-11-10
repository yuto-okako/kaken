class GamesController < ApplicationController
  def index
  end
  
  def gacha
  end
  
  def get_gacha
    use_point = 5
    point = Profile.find_by(user_id: current_user.id).point
    if point >= use_point
      items = ItemMaster.where(gacha: true)
      random = rand(100)
      if random <= 2
        items = items.where(rare: 5)
      elsif random <=12
        items = items.where(rare: 4)
      else
        items = items.where(rare: 3)
      end
      item = items.sample
      item_save(item)
      profile = Profile.find_by(user_id: current_user.id)
      new_point = point - use_point
      profile.update(point: new_point)
      
      @result = ItemMaster.find(item.id).name + 'をGET！'
    else
      @result = 'ポイントが足りません！'
    end
  end
  
  def mix
    @mix = Mixtune.all
  end
  
  def mixing
    item = Mixtune.find(params[:id])
    item = ItemMaster.find_by(name: item.generation)
    @result = item.name + 'を合成しました！'
    @i = Mixtune.count
    item_save(item)
    mt = Mixtune.find(params[:id]).material.split('/')
    mt.each do |m|
      use = ItemMaster.find_by(name: m)
      use = UserItem.find_by(user_id: current_user.id, item_master_id: use.id)
      new_num = use.num - 1
      use.update(num: new_num)
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
  
  private
  
  def item_save(item)     #itemはItemMasterのレコード1件
    if UserItem.find_by(user_id: current_user.id, item_master_id: item.id)
      user_item = UserItem.find_by(user_id: current_user.id, item_master_id: item.id)
      new_num = user_item.num + 1
      user_item.update(num: new_num)
    else
      user_item = current_user.user_items.build(item_master_id: item.id, num: 1)
      user_item.save
    end
  end
end

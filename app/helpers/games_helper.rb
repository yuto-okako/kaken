module GamesHelper
  def mixable?(subject)
    mt = Mixtune.find(subject).material.split('/')
    mt.each do |m|
      item = ItemMaster.find_by(name: m)
      item = UserItem.find_by(user_id: current_user.id, item_master_id: item.id)
      unless item
        return false
      end
      if item
        if item.num == 0
          return false
        end
      end
    end
    return true
  end
end

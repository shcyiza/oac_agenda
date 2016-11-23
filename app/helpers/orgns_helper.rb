module OrgnsHelper

  def your_likes(org)
    current_user.folorgs.where(orgn_id: org.id)
  end


    def followit(org)
      Folorg.new(orgn_id: org.id, user_id: current_user.id)
    end

end

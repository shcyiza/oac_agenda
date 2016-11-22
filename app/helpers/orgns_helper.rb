module OrgnsHelper

  def your_likes(user, org)
    user.folorgs.where(orgn_id: org.id)
  end

end

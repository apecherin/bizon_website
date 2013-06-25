module PagesHelper
  def this_is_admin?
    if !current_user.nil?
      return !Admin.where("email='#{current_user.email}'").empty?
    else
      return false
    end
  end

  def this_is_bizon?(email)
      return !Admin.where("email='#{email}'").empty?
  end
end

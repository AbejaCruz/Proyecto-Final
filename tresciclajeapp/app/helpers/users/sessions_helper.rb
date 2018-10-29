module Users
  # Helper for session functions
  module SessionsHelper
    def resolve_redirection_url
      if current_user.has_role? :admin
        core_users_url
      elsif current_user.has_role? :buyer
        petitions_url
      elsif current_user.has_role? :supplier
        new_core_recycling_record_url
      elsif current_user.has_role? :recycler
        new_core_recycling_record_url
      end
    end
  end
end

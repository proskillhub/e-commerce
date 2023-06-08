class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      
        if current_user.roles.first[:name] == "admin"
            admin_users_path(current_user)
        elsif current_user.roles.first[:name] == "supplier"
            supplier_products_path(current_user)
        else
            customer_products_path(current_user)
        end
    end
end

class SessionsController<ApplicationController
    include CurrentAdminConcern
    def create
        admin = Admin.find_by(name: params["admin"]["name"]).try(:authenticate, params["admin"]["password"])
        if admin
            session[:admin_id]=admin.id
            render json: {status: :created,
            logged_in: true,
            admin: admin
        }  
        else 
            render json:{status: 401}
        end
    end

    def logged_in
        if current_admin
            render json: {
                logged_in: true,
                user: @current_admin
            }
        else
            render json: [
                logged_in: false
            ]
        end
    end

    def logout
        reset_session
        render json: { status: 200, logged_out: true}
    end

    
end
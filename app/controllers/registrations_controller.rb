class RegistrationsController<ApplicationController

    def create
        admin = Admin.create!(
            name: params['admin']['name'],
            password: params['admin']['password']
        )

        if admin
            session[:admin_id] = admin.id
            render json: {
                status: :created,
                admin: admin
            }
        else
            render json: {status: 500}
        end
    end
end
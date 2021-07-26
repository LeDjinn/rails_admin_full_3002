if Rails.env== 'production'
   Rails.application.config.session_store :cookie_store, key: "_loginfull", domain: "myapp.com"
else
    Rails.application.config.session_store :cookie_store, key: "_loginfull"
end

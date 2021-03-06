module ApplicationHelper

    def gravatar_for(user, options = {size: 20})
        email_address = "avatar@gmail.com"  # dummy email address
        # create the md5 hash
        hash = Digest::MD5.hexdigest(email_address)
        # compile URL which can be used in <img src="RIGHT_HERE"...
        image_src = "https://www.gravatar.com/avatar/#{hash}"
        
        image_tag(image_src, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:error] = "You need to sign in first"
            redirect_to login_path
        end
    end

end

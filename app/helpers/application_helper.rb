module ApplicationHelper
    def current_designer
        session[:designer_id] && designer.find(session[:designer_id])
    end
end

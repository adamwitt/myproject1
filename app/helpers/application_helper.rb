# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def output_errors(object)
      object.errors.each { |e| content_tag(:span, e.inspect, :class => "errorLine") }
    end
    
    def logged_in
      if session[:user]
        true
      else
        false
      end
    end
end

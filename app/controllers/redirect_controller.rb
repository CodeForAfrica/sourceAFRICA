# Handle 301 redirects for pages that have changed location.
# NOTE: Only valid relative urls will be redirected for security reasons
#       /foo, yes
#       http://anothersite.com, no, redirects to /
#       //anothersite.com, no, redirects to /
class RedirectController < ApplicationController

  def index
    if params[:url] && is_relative_url?(params[:url])
      return redirect_to(params[:url], :status => 301)
    else
      redirect_to '/'
    end
  end

  def is_relative_url?(url)
    uri = URI.parse(url)
    !uri.host && uri.path && uri.path != ''
  rescue URI::InvalidURIError
    false
  end

end

class ApplicationController < ActionController::Base
#before_action :basic_auth
before_action :configure_permitted_parameters, if: :devise_controller?

private

#def basic_auth
 # authenticate_or_request_with_http_basic do |username, password|
    #username == 'tanimoto' && password == 'tanimoto1'
#end
#end
def set_parents
  @parents = Category.where(ancestry: nil)
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :gender_id, :occupation_id, :age_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :image])
end

def no_use_turbolinks_cache
  @use_turbolinks_cache = false
end

end

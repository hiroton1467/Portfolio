class ApplicationController < ActionController::Base
#before_action :authenticate_user!, except: [:top]
  before_action :authenticate_any!

  def authenticate_any!
    if request.path.match(/\/admin(\/)?/) # url判定(urlにadminを含んでいるか)
      authenticate_admin! #adminログイン制限

    else
      authenticate_user! # customerログイン制限
    end
  end
end

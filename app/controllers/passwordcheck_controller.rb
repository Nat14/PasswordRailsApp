class PasswordcheckController < ApplicationController
  def validate
    @username = params[:username]
    @password = params[:pass]

    def validatePassword(name, password)
      if check6char(name, "Username") || usrDoesNotContainSpecial(name, "Username") || check6char(password, "Password") || !pswdDoesNotContainSpecial(password, "Password") || pswdContainPswd(password)
      "INVALID!!!"
      else
        "Username and password are valid!"
      end
    end

    def check6char(str, str2)
      if str.length < 6
        @message =  "#{str2} must have more than 6 characters"
        true
      end
    end

    def usrDoesNotContainSpecial(str, str2)
      a = (str =~ /[!#$]/)
      if a.to_i > 0
        @message = "#{str2} can not contain any special characters."
        true
      else
        false
      end
    end

    def pswdDoesNotContainSpecial(str, str2)
      a = (str =~ /[!#$]/)
      if a.to_i > 0
        true
      else
        @message = "#{str2} must contain at least one $, !, or #."
        false
      end
    end

    def pswdContainPswd(str)
      if str.upcase.include? "PASSWORD"
        @message = "Password can not contain password!"
        true
      else
        false
      end
    end
    @result = validatePassword(@username, @password)
  end
end

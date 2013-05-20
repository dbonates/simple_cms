require 'rails_autolink'

class DemoController < ApplicationController
  
  layout 'admin'
  
  def index
   #render('dbo')
   #redirect_to(:action => 'hello')
  end
  
  def hello
    #render(:text => 'Hello Every1!')
    #redirect_to('http://bonates.com')
    @id = params[:id]
    @page = params[:page].to_i
    @array = [1,2,3,4,5]
    @usuario = "Daniel Bonates"
  end
  
  def dbo
    render('dbo')
  end
  
  def other_hello
    #render(:text => 'Hello de novo!')
  end
  
  def javascript
  end
  
  def text_helpers
    
  end
  
  def escape_output
  end
  
  
end

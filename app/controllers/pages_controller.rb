class PagesController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_subject
  
  def index
    list
    render ('list')
  end
  
  def list
    @pages = Page.order("pages.position ASC").where(:subject_id => @subject.id)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page_count = @subject.pages.size + 1
    @page = Page.new(:subject_id => @subject.id, :name => "P&aacute;gina".html_safe, :position => @page_count)
    @subjects = Subject.order("position ASC")
  end
  
  def create
    
    #cria um objeto a partir dos object enviado pelo form
    @page = Page.new(params[:page])
    
    #salva
    if @page.save
      
      flash[:notice] = "Page criada com sucesso!"
      redirect_to(:action => 'list', :subject_id => @page.subject_id)
      
    else
      
      @page_count = @subject.pages.size + 1
      render('new')
      
    end
    
    
    
  end

  def edit
    
    @page = Page.find(params[:id])
    @page_count = @subject.pages.size
    @subjects = Subject.order("position ASC")
    
  end
  
  def update
    #cria um objeto a partir dos object enviado pelo form
    @page = Page.find(params[:id])
    @page_count = Page.count
    
    #salva
    if @page.update_attributes(params[:page])
      
      flash[:notice] = "Page atualizada com sucesso!"
      redirect_to(:action => 'show', :id => @page.id, :subject_id => @page.subject_id)
      
    else
       @page_count = @subject.pages.size
      render('edit')
      
    end
  end

  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    Page.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted..."
    redirect_to :action => 'list', :subject_id => @subject.id    
  end
  
  private
  
  def find_subject
    if params[:subject_id]
      @subject = Subject.find_by_id(params[:subject_id])
    end
  end
end

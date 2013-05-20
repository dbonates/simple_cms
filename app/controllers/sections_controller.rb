class SectionsController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_page

  def index
    list
    render ('list')
  end
  
  def list
    @sections = Section.order("sections.position ASC").where(:page_id => @page.id)
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @pages = Page.order("position ASC")
    @section_count = @page.sections.size + 1
    @section = Section.new(:page_id => @page.id, :name => 'New Section', :content_type => 'text', :position => @section_count, :content => "conteudo", :content_type => "text/html")
    
  end

  def create
    
    @section = Section.new(params[:section])
    
    if @section.save
      flash[:notice] = "Successfully created..."
      redirect_to(:action => "show", :id => @section.id, :page_id => @page.id)
    else
      flash[:notice] = "Tenta de novo..."
      render('new')
      @section_count = @page.sections.size + 1
    end
    
  end

  def edit
    @section_count = @page.sections.size
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
  end

  def update
    
    @section = Section.find(params[:id])
    
    if @section.update_attributes(params[:section])
      
      flash[:notice] = "Successfully updated..."
      redirect_to :action => 'show', :id => @section.id, :page_id => @page.id
      
    else
      @section_count = @page.sections.size
      render 'edit'
    end
    
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    Section.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted..."
    redirect_to(:action => 'list', :page_id => @page.id)
  end
  
  
  private
  
  def find_page
    
    if params[:page_id]
      @page = Page.find_by_id(params[:page_id])
      @subject = Subject.find_by_id(@page.subject_id)
    end
  end
  
end

class SubjectsController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  
  def index
    #call the action
    list 
    
    # evitar que ele tente renderizar o template index e direciona-lo pro template list
    render('list')
  end
  
  def list
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def new
    
    @subject_count = Subject.count + 1
    @subject = Subject.new(:position => @subject_count, :visible => true)
     
  end
  
  def create
  
    # Instanciar um novo objeto usando os parametros do form
  
    @subject = Subject.new(params[:subject])
  
    # salvar o objeto
  
    if @subject.save
    
      flash[:notice] = "Successfully created..."
      redirect_to(:action => 'list')
    
    else
      
      @subject_count = Subject.count + 1
      render('new')
      
    end
  
    # salvando sem erro, redirecionar para lista
  
    # se rolar erro, redisplay o form para que o usuario faça o ajuste
  
  end
  
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  
  #----- update
  def update
    
    # Encontrar o objeto selecionado
    @subject = Subject.find_by_id(params[:id])
    
    # atualizar o objeto
    if @subject.update_attributes(params[:subject])
      #salvou com sucesso
      flash[:notice] = "Successfully updated..."
      redirect_to(:action => 'show', :id => @subject.id)
      
    else
      @subject_count = Subject.count
      render('edit')
      
    end
    
  end # ---- end update
  
  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    
    Subject.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted..."
    redirect_to(:action => 'list')
    
  end
  
end

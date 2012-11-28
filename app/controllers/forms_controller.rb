class FormsController < ApplicationController
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
    @fields = @form.fields
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])

    respond_to do |format|
      if @form.save
        format.html { redirect_to edit_form_path @form, notice: 'Form was successfully created.' }
        format.json { render json: @form, status: :created, location: @form }
      else
        format.html { render action: "new" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      @form.update_attributes(params[:form])        
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])    

    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end
  
  def addtext
    @form = Form.find(params[:form_id])
    @field = @form.fields.build
    @field.assign_attributes({
      :descryption => 1, # text
      :lenght => 2,
      :value_unique  => 0,
      :view => 1,
      :formated => 1,
      :label => "Sem Label"
    })
    @field.save
  end
  
  def addtextnumeric
    @form = Form.find(params[:form_id])
    @field = @form.fields.build
    @field.assign_attributes({
      :descryption => 2, # text numeric
      :lenght => 2,
      :value_unique  => 0,
      :view => 1,
      :formated => 3,
      :label => "Numero"          
    })
    @field.save
  end
  
  def addtextarea
    @form = Form.find(params[:form_id])
    @field = @form.fields.build
    @field.assign_attributes({
      :descryption => 3, # textarea
      :lenght => 1,
      :value_unique  => 0,
      :view => 1,
      :formated => 1          
    })
    @field.save
  end
  
  def remfield
    busca = Field.find(:all, :conditions => {:id => params[:form_id]})
    @field = busca.first
    @last_id = @field.id 
    @field.destroy        
  end
  
  def getfield
    #render 'print', params => params
    @fields = Field.find(:all, :conditions => {:id => params[:id], :form_id => params[:form_id]})
    @field = @fields.first
  end
  
  def update_field
    @field = Field.find(params[:id])
    # var campos[:field] = params
    if @field.update_attributes(
      :label        => params[:label],
      :descryption  => params[:descryption],
      :min          => params[:min],
      :max          => params[:max],
      :predefined   => params[:predefined],
      :instruction  => params[:instruction],
      :value_unique => params[:value_unique],
      :view         => params[:view],
      :formated     => params[:formated],
      :lenght       => params[:lenght]
    )  
      flash[:notice] = "Salvo com sucesso."  
    else
      flash[:notice] = "Erro ao salvar"
    end
    # @field.save       
    # @field.update_attributes(:fields => params[:fields])
  end
end

class SearchIndicesController < ApplicationController
  # GET /search_indices
  # GET /search_indices.xml
  def index
    @search_indices = SearchIndex.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @search_indices }
    end
  end

  # GET /search_indices/1
  # GET /search_indices/1.xml
  def show
    @search_index = SearchIndex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search_index }
    end
  end

  # GET /search_indices/new
  # GET /search_indices/new.xml
  def new
    @search_index = SearchIndex.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search_index }
    end
  end

  # GET /search_indices/1/edit
  def edit
    @search_index = SearchIndex.find(params[:id])
  end

  # POST /search_indices
  # POST /search_indices.xml
  def create
    @search_index = SearchIndex.new(params[:search_index])

    respond_to do |format|
      if @search_index.save
        flash[:notice] = 'SearchIndex was successfully created.'
        format.html { redirect_to(@search_index) }
        format.xml  { render :xml => @search_index, :status => :created, :location => @search_index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /search_indices/1
  # PUT /search_indices/1.xml
  def update
    @search_index = SearchIndex.find(params[:id])

    respond_to do |format|
      if @search_index.update_attributes(params[:search_index])
        flash[:notice] = 'SearchIndex was successfully updated.'
        format.html { redirect_to(@search_index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @search_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /search_indices/1
  # DELETE /search_indices/1.xml
  def destroy
    @search_index = SearchIndex.find(params[:id])
    @search_index.destroy

    respond_to do |format|
      format.html { redirect_to(search_indices_url) }
      format.xml  { head :ok }
    end
  end
end

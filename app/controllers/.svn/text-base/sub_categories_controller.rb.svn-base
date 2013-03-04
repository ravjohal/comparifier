class SubCategoriesController < ApplicationController
require 'net/http'
require 'rexml/document'
  # GET /sub_categories
  # GET /sub_categories.xml
  def index
    @sub_categories = SubCategory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_categories }
    end
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.xml
  def show
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

  # GET /sub_categories/new
  # GET /sub_categories/new.xml
  def new
    @sub_category = SubCategory.new
    
    #i added 
    @categories = Category.find(:all, :order=>["id asc"]).collect {|a| [a.name, a.id]}
    #select(:record, 'category_id', Category.find(:all, :order=>["id asc"]).collect {|a| [a.id, a.category]})
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_category }
        
    end
  end

  # GET /sub_categories/1/edit
  def edit
    @sub_category = SubCategory.find(params[:id])
    @categories = Category.find(:all, :order=>["id asc"]).collect {|a| [a.name, a.id]}
    #debugger
  end

  # POST /sub_categories
  # POST /sub_categories.xml
  def create
    
    @sub_category = SubCategory.new(params[:sub_category])
    @sub_category.category_id = params["record"]["category_id"]
    
    respond_to do |format|
      if @sub_category.save
        flash[:notice] = 'SubCategory was successfully created.'
        format.html { redirect_to(@sub_category) }
        format.xml  { render :xml => @sub_category, :status => :created, :location => @sub_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_categories/1
  # PUT /sub_categories/1.xml
  def update
    @sub_category = SubCategory.find(params[:id])
    @sub_category.category_id = params["record"]["category_id"]
    #@sub_category.category_id = Category.find(params["record"]["category_id"])
    #debugger
      
    respond_to do |format|
      if @sub_category.update_attributes(params[:sub_category])
        flash[:notice] = 'SubCategory was successfully updated.'
        format.html { redirect_to(@sub_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.xml
  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy

    respond_to do |format|
      format.html { redirect_to(sub_categories_url) }
      format.xml  { head :ok }
    end
  end
  
  def show_all_sub_categories
  @sub_categories_all = SubCategory.find(:all, :conditions => ["category_id = ?", params[:id]])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_categories_all }
    end
  end
  
  def show_apicall

    #@create_api_url = SubCategory.find(:first, :conditions => ["id = ?", params[:id]])
    @create_api_url = SubCategory.find(params[:id])
    
    #requestData = Request.new
    #render :controller => :requests, :action => :getRequest
    #requestData.setRequest
    #@new_url = requestData.class
   #@new_url = request.getRequest
    
    ###Browse Node
    key_id = "1CFABWVFK15HFNG1D7R2"
    service = "AWSECommerceService"
    associate = "comparifier-20"
    local = "US" 
    operation = "BrowseNodeLookup"
    browseName = @create_api_url.name
    browseID = @create_api_url.browseId.to_s
    response_group = "BrowseNodeInfo"
    version = "2008-08-19"
    
    url = 'http://ecs.amazonaws.com/onca/xml?'
    url = url +'Service='+service+'&'
    url = url +'AWSAccessKeyId='+key_id+'&'
    url = url +'Operation='+operation+'&'
    url = url +'BrowseNodeId='+browseID+'&'
    url = url +'ResponseGroup='+response_group+'&'
    url = url + 'Version='+version
       
    @show_apicall_url = url
    
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    doc = REXML::Document.new(xml_data)
    @doc = doc
    
    root = doc.root
    
    #browse = []
#    doc.elements.each('BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode') do |ele|
#      browse << ele.text
#    end
    
#    browse = root.each_element('//BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode') {|e| puts e}
#    @browse = browse
    
    browseNodeIdHash = Hash.new
    #browseNodeIdHash["test"] = "test_value_in_hash"
    #doc.elements.each("inventory/section") { |element| puts element.attributes["name"] }
    root.each_element("//BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode") { |e|
      browseNodeIdHash[e.elements['BrowseNodeId'].text] = e.elements['Name'].text 

    }
    
    @browseNode = browseNodeIdHash
   

    
#    tempHash = {}
#    doc2 = doc.elements.each("BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode") { |doc2.element.each| (tempHash[element["BrowseNodeId"]] = element["Name"])}  
#    @temp = tempHash
    
    all_browse_node = doc.elements.to_a("BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode")
    @temp2 = all_browse_node
  
  end
  
  def show_browseNode
  
    #@create_api_url = SubCategory.find(:first, :conditions => ["id = ?", params[:id]])
    @create_api_url = SubCategory.find(params[:id])
    
    ###Browse Node
    key_id = "1CFABWVFK15HFNG1D7R2"
    service = "AWSECommerceService"
    associate = "comparifier-20"
    local = "US" 
    operation = "BrowseNodeLookup"
    browseName = @create_api_url.name
    browseID = @create_api_url.browseId.to_s
    response_group = "BrowseNodeInfo"
    version = "2008-08-19"
    
    url = 'http://ecs.amazonaws.com/onca/xml?'
    url = url +'Service='+service+'&'
    url = url +'AWSAccessKeyId='+key_id+'&'
    url = url +'Operation='+operation+'&'
    url = url +'BrowseNodeId='+browseID+'&'
    url = url +'ResponseGroup='+response_group+'&'
    url = url + 'Version='+version
       
    @show_apicall_url = url
    
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    doc = REXML::Document.new(xml_data)
    @doc = doc
    
    root = doc.root
    
    #browse = []
  #    doc.elements.each('BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode') do |ele|
  #      browse << ele.text
  #    end
    
  #    browse = root.each_element('//BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode') {|e| puts e}
  #    @browse = browse
    
    browseNodeIdHash = Hash.new
    browseNodeIdHash["test"] = "test_value_in_hash"
    #doc.elements.each("inventory/section") { |element| puts element.attributes["name"] }
    root.each_element("//BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode") { |e|
      browseNodeIdHash[e.elements['BrowseNodeId'].text] = e.elements['Name'].text 
  
    }
    
    @browseNode = browseNodeIdHash
   
  
    
  #    tempHash = {}
  #    doc2 = doc.elements.each("BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode") { |doc2.element.each| (tempHash[element["BrowseNodeId"]] = element["Name"])}  
  #    @temp = tempHash
    
    all_browse_node = doc.elements.to_a("BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode")
    @temp2 = all_browse_node
  
  end
  
  def show_nextBrowseNode

        @browseID = params[:id]
        
        ###Browse Node
        key_id = "1CFABWVFK15HFNG1D7R2"
        service = "AWSECommerceService"
        associate = "comparifier-20"
        local = "US" 
        operation = "BrowseNodeLookup"
        browseID = @browseID
        response_group = "BrowseNodeInfo"
        version = "2008-08-19"
        
        url = 'http://ecs.amazonaws.com/onca/xml?'
        url = url +'Service='+service+'&'
        url = url +'AWSAccessKeyId='+key_id+'&'
        url = url +'Operation='+operation+'&'
        url = url +'BrowseNodeId='+browseID+'&'
        url = url +'ResponseGroup='+response_group+'&'
        url = url + 'Version='+version
           
        @show_apicall_url = url
        
        xml_data = Net::HTTP.get_response(URI.parse(url)).body
        doc = REXML::Document.new(xml_data)
        @doc = doc
        
        root = doc.root
        
        nextBrowseNode = Hash.new
        root.each_element("//BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode") { |e|
          nextBrowseNode[e.elements['BrowseNodeId'].text] = e.elements['Name'].text 
      
        }
        
        @nextBrowseNode = nextBrowseNode
        
  end
  
end

class RequestsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :sendBrowseNodeLookupRequest

  def sendBrowseNodeLookupRequest
    #TODO: this is where I need to parse the XML and save it as a better XML for Flex to view.
    # Perhaps even just send to Flex only the BrowseNode elements.
    xml_data = Net::HTTP.get_response(URI.parse(params[:request_URL])).body
#    @doc = REXML::Document.new(xml_data)
    render :xml => xml_data
  end
  
  def allTopLevelCategories
    @all_top_level_categories = Category.find(:all, :include => :sub_categories)
   # @all_top_level_categories = SubCategory.find(:all, :include => :category)
     #@all_top_level_categories = Category.subcategories
    respond_to do |format|
#      format.html
      format.xml { render :xml => @all_top_level_categories}
      format.amf { render :amf => @all_top_level_categories}
    end
  end
  
  def associatedSecondLevelCategories
#    @associated_second_level_categories = SubCategory.find(:all, :conditions => ["category_id = ?", params[0][:category_id]])
    category = Category.find([:category_id])
    @associated_second_level_categories =  category.sub_categories
    
    respond_to do |format|
#      format.html
      format.xml { render :xml => @associated_second_level_categories}
      format.amf { render :amf => @associated_second_level_categories}
    end
  end
    
  def createItemSearchRequest()
    
  end
  
  def createItemLookupRequest()
    
  end
  
  def createSimilarityLookupRequest()
    
  end
  
  # The following methods might not be needed
#sample call to this: BrowseNodeLookup a = RequestsController.new()
#                     a.createRequest(request)
#  def createRequest(request)
#    #put it all together into the instance variable request_URL
#    #this variable is going to be unique per each request
#    @request_URL = @@CONSTANT_URL+@@service+@@aws_access_key_id+@@version
#  end
#  def getSearchOperation(operationType)
#    #if searching through search bar, then the operation is ItemSearch, if searching for one item, then it is ItemLookup
#    #and so on...
#  end
#  
#  def getValidParameters(operation)
#    #the valid parameters depends on the operation
#  end
#  
#  def getSearchIndex(search_index)
#    #this method might not be needed, but the search_index should be brought back from Flex.
#  end
#  
#  def getValidResponseGroup(operation)
#    #depends on what operation
#  end
#  
#  def getValidSortCriteria(search_index)
#    #depends on the search index chosen
#  end
#  
#  def getValidSearchIndexParameters(search_index)
#    #these parameters are specific to each search_index
#  end

# This method will be deprecated as there will be no save until next release.
#  def saveRequest
#    #save request to database here
#  end  

private
  def createRequestCommon
    #class constant (available to class, not instance, only one per all instances of this class):
    @@CONSTANT_URL = 'http://ecs.amazonaws.com/onca/xml?'
    
    #class variable (aka static variable, only one for all instances):
    @@service = 'Service=AWSECommerceService&'
    
    #class variable:
    @@aws_access_key_id = 'AWSAccessKeyId=1CFABWVFK15HFNG1D7R2&'
    
    #class variable:
    @@version = 'Version=2008-08-19&'
    @@operationName = 'Operation'
    @@equalsign = '='
    @@ampersand = '&'
    @request_URL = @@CONSTANT_URL+@@service+@@aws_access_key_id+@@version
  end
end

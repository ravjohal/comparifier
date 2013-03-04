require 'rubygems'
require 'rexml/document'
require 'httparty'
require 'pp'
require 'xmlsimple'
require 'cgi'
require 'time'
require 'hmac'
require 'hmac-sha2'
require 'base64'
require 'amazon_product_advertising_api'
require 'logger'

#require 'amazon/aws'
#require 'amazon/aws/search'
#require 'libxml'

class ComparifierRequestsController < ApplicationController
include REXML
include HTTParty
#include Amazon::AWS
#include Amazon::AWS::Search

AmazonProductAdvertisingApi::Base.access_key_id = "1CFABWVFK15HFNG1D7R2"
AmazonProductAdvertisingApi::Base.secret_access_key = "V2DTwP41ER8nDTiVWEkNQNKueArA0tubM6+7L1i6"
 
# Setup Associates IDs for whichever regions you're selling to
AmazonProductAdvertisingApi::Base.associate_ids.us = "comparifier-20"

ACCESS_IDENTIFIER = '1CFABWVFK15HFNG1D7R2'
SECRET_IDENTIFIER = 'V2DTwP41ER8nDTiVWEkNQNKueArA0tubM6+7L1i6'
SERVICE = 'AWSECommerceService'
VERSION = '2009-07-01'

AMAZON_ENDPOINT = 'http://ecs.amazonaws.com'

base_uri AMAZON_ENDPOINT

#default_params :Service => 'AWSECommerceService', :AWSAccessKeyId => '1CFABWVFK15HFNG1D7R2', :Version => '2009-07-01', :Timestamp => Time.now.gmtime.iso8601
format :xml

@browse_categories = []

#Most likely won't need the following constants anymore because of httparty gem.
  
  @@CONSTANT_URL = 'http://ecs.amazonaws.com/onca/xml?'
    
    @@service = 'Service=AWSECommerceService&'
    @@key_id = '1CFABWVFK15HFNG1D7R2'
    @@aws_access_key_id = 'AWSAccessKeyId=1CFABWVFK15HFNG1D7R2&'
    
    @@version = 'Version=2009-02-01&'
    @@operationName = 'Operation'
    @@equalsign = '='
    @@ampersand = '&'

def self.request_uri; "/onca/xml"; end  
  
# Method Description:
# Passes the category Browse ID along to a method that will build the URL
# 
# Parms:
# params[0] is the vendor (Amazon for now)
# params[1] is the search Index, used for categories that don't have products so that an ItemSearch can be run...
# params[2] is the options object/hash aka parameters (includes: operation (ItemSearch, ItemLookup, BrowseNodeLookup and SimilarityLookup for Amazon))
#
# Returns:
# Array of categories
#
# TODO: Perhaps build one method per operation???
  def getBrowseCategories
# used the following line for purposes of testing local connection to flex (it works!) (when you can't access Amazon):
#    @browse_categories = Category.find(:all, :conditions => { :vendorCategoryId => params[0], :vendor => params[1]})
#    puts params[0]

  
    #using params because that is how RubyAMF gets what is coming in from Flex
    @browse_categories = sendRequest(params[0], params[1], params[2])
    
#    @browse_categories =  request_URL;
  
# for local testing, from database (when not connected to amazon):  
#    @browse_categories = Category.find(:all)
    respond_to do |format|
      format.html {render :xml => @browse_categories}
      format.amf {render :amf => @browse_categories}
    end
  end
  
  def getItems
    
  end

# Method Description:
# Takes in a URL and posts a request to the specified URL
# 
# Parms:
# request_URL
#
# Returns:
# XML from Amazon; need to generalize
# 
  def sendRequest(vendor, searchIndex, options)
    
    # the default_params are part of httparty and will append specific name, value pair to the base_uri (which is defined up above)
     #self.class.default_params :Operation => operation
            
      #create a parameters hash to collect the parameters that were passed along from flex.  
      #use the :query key to allow httparty to recognize that they are part of a url query (this will append to url).
      parameters = {}
      
      parameters[:query] = options.inject({}) {|result, element|
        result[element.first.to_s] = element.last
        result
      }
      
      # puts "options2222: " + parameters.inspect
      # the get method is from httparty, parameters are the parameters from flex, from user. This will return a hash.
      
      #The following works for ruby-aaws gem:
#      browseNodeLookup = BrowseNodeLookup.new(options['BrowseNodeId'], {})
#      responseGroup = ResponseGroup.new('BrowseNodeInfo')          
#      request = Request.new(@@key_id,'comparifier-20')
#      request.locale = 'us'      
#      response = request.search(browseNodeLookup, responseGroup)
 

# The following is for HTTParty...

#-----FROM HERE-----Works, but commenting out to try the Product API gem----------#   

############        signed_request = sign_request(options.merge!(self.class.default_params))

#        puts "\n SIGNED PARAMETERS: " + signed_request.inspect + "\n"

############        response = self.class.get(self.class.request_uri, :query => signed_request)

#-----TO HERE-----Works, but commenting out to try the Product API gem----------#   

    
        
#+++++FROM HERE+++++Trying out the Product API gem++++++#         
    @browse_categories = browseNodeLookup(options, searchIndex)    
#+++++TO HERE+++++Trying out the Product API gem++++++# 
                

   
       # xml_doc = LibXML::XML::Parser.file(xml_data)
       # xml_doc = xml_doc.parse
#        xml_doc = Document.new(xml_data)

#-----FROM HERE-----Works, but commenting out to try the Product API gem----------#   
############      puts "xml: -----------------------------------------------------------------: \n\n " + response.to_s + "   \n\n----------------------------------------------"
############        parseResponse(response, vendor, searchIndex, options)
#-----TO HERE-----Works, but commenting out to try the Product API gem----------#   
  end

# Method Description:
# Parses the incoming hash that comes from Amazon...httparty turns the xml into hash
# NOT BEING USED WHEN GOING WITH PRODUCT API gem
  def parseResponse(response, vendor, searchIndex, options)
    
    if vendor == "Amazon"
      @browse_categories = callAmazonOperations(response, vendor, searchIndex, options)
    end 
   
    @browse_categories
  end
  

  
#OPERATION METHODS:

#NOT BEING USED DUE TO THE PRODUCT API
  def callAmazonOperations(response, vendor, searchIndex, options)
     operation = options["Operation"]
    
    puts "operation: \n " + operation;
    
    browseIds = ""
    options.each{|name, value| 
      if name == "BrowseNodeId"
        browseIds = value
      end    
    }
    
    browseIdArray = browseIds.split(',')
    requestBrowseIds = []
    browseIdArray.each{|id|
      requestBrowseIds.push(id.delete('&'))
    }

    #nextBrowseNode = Hash.new
#    nextBrowseNode[e.elements['BrowseNodeId'].text] = e.elements['Name'].text }
    
#    nodes = root.find("//BrowseNodeLookupResponse/BrowseNodes/BrowseNode/Children/BrowseNode")
#    
#    nodes.each_element {|element| 
#      browseNodeId = element.find("//BrowseNodeId").first.content
#      name = element.find("//Name").first.content
#      category = Category.new
#      category.name = name
#      category.vendorCategoryId = browseNodeId
#      category.vendor = vendor
#      category.operation = operation
#      @browse_categories.push(category)}


    if operation == "BrowseNodeLookup"
#-----FROM HERE-----Works, but commenting out to try the Product API gem----------#   
########      @browse_categories = browseNodeLookup(response, searchIndex)
#-----TO HERE-----Works, but commenting out to try the Product API gem----------#         
    elsif operation == "ItemSearch"
      itemSearch()
    elsif operation == "ItemLookup"
      itemLookup()
    elsif operation == "SimilarityLookup"
      similarityLookup()
    end
    @browse_categories
  end
  
  
  
  
  # BrowseNodeLookup Operation
  # Parses the response and passes it on to the category class...
  def browseNodeLookup(options, searchIndex)
    
        #puts "\n\n\n itemSearch: " + browseNodeId + "   " + searchIndex + "\n\n\n"
      
#+++++FROM HERE+++++Trying out the Product API gem++++++#    

     
    category_request = AmazonProductAdvertisingApi::Operations::BrowseNode::BrowseNodeLookup.new(options["BrowseNodeId"], :us)
    category_request.response_group = options["ResponseGroup"]
    category_request.run
    
    puts "\n\n RIGHT AFTER CALLING AMAZON" + category_request.is_valid.to_s + "   \n\n "
    
    if (category_request != nil) and (category_request.is_valid == true) and (category_request.response.browse_nodes.first != nil)
        category = Category.new
        @browse_categories = category.extract_children(category_request, searchIndex)
    else
      #perhaps handle errors and return some type of error to flex or perhaps another operation?
      puts "\n\n WHEN DOES THIS OCCUR$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ \n\n"
    end
    
   # puts "\n\n Raw XML WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW " + category_request.raw_data.to_s + "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW\n\n"
    puts "LOOOOOOOOOOOOOOOOOOOOOOOOOOOKUUUUUUPPPPPPPP REQUEST: " + category_request.request_uri.to_s + "\n\n"
   # log = Logger.new('../log/debug.log')
   # log.debug("LOOOOOOOOOOOOOOOOOOOOOOOOOOOKUUUUUUPPPPPPPP REQUEST: " + category_request.request_uri.to_s + "\n\n")
#+++++TO HERE+++++Trying out the Product API gem++++++#




#-----FROM HERE-----Works, but commenting out to try the Product API gem----------#   
         #Changing it back to xml so that I can HappyMap it...
#      if response.class == Hash
#         response = XmlSimple.xml_out(response['BrowseNodeLookupResponse'])
#      end
#         
#      response = REXML::Document.new(response)
#      
#      root = response.root
#
#
#    # following is for XML response:
#      root.each_element("//BrowseNodes/BrowseNode") { |category_xml|
#        if category_xml == nil
#          #send back some type of error...exception to flex?
#        end
#        category = Category.new
#        
#        puts "category_xml::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: " + category_xml.to_s + " :::::::::::::::::::::::::::::::::"
#        
#        @browse_categories = category.from_xml(category_xml, searchIndex)
#      }

#-----TO HERE-----Works, but commenting out to try the Product API gem----------#



    #      response = response['Children']
    #      pp response.inspect
   
    #Works for ruby-aaws gem:  
    #    nodes = response.browse_node_lookup_response[0].browse_nodes[0].browse_node
    #
    #    nodes.each do |resp|
    #      if resp.children
    #        resp.children[0].browse_node.each do |child_node|
    #          puts ' CHILD: %s' % [child_node.name]
    #        end
    #      else
    #        puts 'NO CHILDREN!!!!!!!'
    #      end
    #    end


    #      response.each{|key|
    #        puts "THE KEYYYYYYYYYYYYYYYYYYYYYYY: " + key.to_s + "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    #        key.each{|key1, value|
    #          puts "THE VALUUUUUUEEEEEEEEEEEE: " + key1.to_s + " --------------------------------------------------------- " + value.to_s
    #          value.each{|key2, value2|
    #            puts "Third Level KEY: " + key2.to_s + "/////////////////////////////////////////////////" + value2.to_s
    #         }
    #        }
    #        
    #        category = Category.new
    #        @browse_categories = category.from_hash(response)
    #      }
      
    if @browse_categories == nil or @browse_categories.size == 0
#        puts "\n\n\n NULLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL \n\n\n"
        #Do a product search under the browse node specified...not sure how to do that...Search Index???
# This isn't ready to be called yet as the Item Model in both the ruby and flex side need to be created...
        @browse_categories = itemSearch(options, searchIndex)
    end
    
    @browse_categories
    
  end

#  def itemSearchAMF(options, searchIndex)
#    items = itemSearch(options, searchIndex)
#    
#    respond_to do |format|
#      format.html {render :xml => items}
#      format.amf {render :amf => items}
#    end
#  end

  def itemSearch(options, searchIndex)
    
    browseNodeId = options["BrowseNodeId"]
    
    items_request = AmazonProductAdvertisingApi::Operations::Item::ItemSearch.new(searchIndex, :us)
    items_request.browse_node = browseNodeId
    items_request.response_group = "Large"
    items_request.run
  #  log = Logger.new('../log/debug.log')
  #  log.debug "\n BROWSENODEID " + browseNodeId + " " + searchIndex + "\n"
    #and (items_request.response.items.first != nil)
    if (items_request != nil) and (items_request.is_valid == true) 
      items = Item.new
      @browse_categories = nil
      @browse_categories = items.extract_items(items_request)
  #    log.debug "got back items? " + @browse_categories.to_s
      return @browse_categories
    else
      #perhaps handle errors and return some type of error to flex or perhaps another operation?
      puts "\n\n WHEN DOES THIS OCCUR$$$$$$$$$$$$$$$ " + items_request.errors.first.message + "\n\n"
      
      return nil
    end
    
#    root.each_element("//ItemSearchResponse/Items") { |item_xml|
#      
#      item = Item.new
#      item.from_xml(item_xml)
#      
#      }
  end
  
  def itemLookup
    root.each_element("//ItemLookupResponse/Item") { |item_xml|
      
      item = Item.new
      item.from_xml(item_xml)
      
      }
  end
  
  def similarityLookup
    
  end
  
  
  
  
  
#Signature stuff:
  def sign_request(params)
    #params.reverse_merge!(:Timestamp => self.class.default_params[:Timestamp], :Version => self.class.default_params[:Version])
    params.reverse_merge!(:Service => SERVICE, :AWSAccessKeyId => ACCESS_IDENTIFIER, :Version => VERSION, :Timestamp => Time.now.gmtime.iso8601)
    params.merge!(:Signature => build_signature(params, "GET"))
    
    querystring = params.sort.collect do |key, value| 
      [aws_escape(key.to_s), aws_escape(value.to_s)].join('=') 
      end.join('&')
    signed_url = "#{AMAZON_ENDPOINT}#{self.class.request_uri}?#{querystring}"
    
    puts "\n THE URL TO BE SENT TO AMAZON: \n " + signed_url + " \n"
    
    params
  end
 
  private
 
  def build_string_to_sign(params, http_verb)
    returning [] do |string_to_sign|
      string_to_sign << http_verb << self.class.base_uri.gsub(/^https?\:\/\//, "") << self.class.request_uri
      canonicalized_params = params.sort.collect do |key, value| 
        [aws_escape(key.to_s), aws_escape(value.to_s)].join('=') 
      end.join('&')
      
#      canonicalized_params = params.sort_by {|k,v| k.to_s }.map do |kvp|
#        "#{aws_escape(kvp.first.to_s)}=#{aws_escape(kvp.second.to_s)}"
#      end.join("&")
      string_to_sign << canonicalized_params
    end.join("\n")
  end
 
  def build_signature(params, http_verb)
    #params.merge!(self.class.default_params)
 
    hmac = HMAC::SHA256.new(SECRET_IDENTIFIER)
    hmac.update(build_string_to_sign(params, http_verb))
 
    Base64.encode64(hmac.digest).chomp
  end
 
  def aws_escape(string)
    CGI.escape(string).gsub(" ", "%20").gsub("%7E", "~")
  end
  
end

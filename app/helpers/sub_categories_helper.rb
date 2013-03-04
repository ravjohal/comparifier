module SubCategoriesHelper
  
#  def categorey_id_column(record, input_name)
#    
##    * The object is the name of an instance variable. This is typically a model object (singular name of the table whose data your displaying, or in other words, the table record).
##    * The method is the attribute of that instance variable. This is typically a field/column of the table whose data your displaying (really an ActiveRecord method).
##    * Together the object and method specify the name of the select statement in the generated html
##    * choices can be any enumerable object e.g arrays and hashes and results of database queries, and contains the option tags for the select box.
##    * The optional options argument takes various "options" some of which are listed below in the examples.
##    * The optional html_options argument allows css to be used for styling the select box.
##    * If one of the option tags in choices matches @object.method, that option tag will be selected
#
#    
#    #select(object, method, choices, options = {}, html_options = {})
#    #select(:record, 'mandal_id', MandalMaster.find(:all, :order=>["mandal asc"]).collect {|a| [ a.mandal, a.mandal_id ]}, {:selected => record.mandal_id, :include_blank => true}, mandal_html_options_person );
#  end
#    def category_id_column(record, input_name)
#      
#  #    * The object is the name of an instance variable. This is typically a model object (singular name of the table whose data your displaying, or in other words, the table record).
#  #    * The method is the attribute of that instance variable. This is typically a field/column of the table whose data your displaying (really an ActiveRecord method).
#  #    * Together the object and method specify the name of the select statement in the generated html
#  #    * choices can be any enumerable object e.g arrays and hashes and results of database queries, and contains the option tags for the select box.
#  #    * The optional options argument takes various "options" some of which are listed below in the examples.
#  #    * The optional html_options argument allows css to be used for styling the select box.
#  #    * If one of the option tags in choices matches @object.method, that option tag will be selected
#  
#      
#      #select(object, method, choices, options = {}, html_options = {})
#      #select(:record, 'mandal_id', MandalMaster.find(:all, :order=>["mandal asc"]).collect {|a| [ a.mandal, a.mandal_id ]}, {:selected => record.mandal_id, :include_blank => true}, mandal_html_options_person );
#       select(:record, 'category_id', Category.find(:all, :order=>["id asc"]).collect {|a| [a.id, a.category]})
#    end

  
end

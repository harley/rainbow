# for using a different value for the id field of your Solr documents
# Sunspot::Indexer.module_eval do
#   alias :old_prepare :prepare
#   def prepare(model)
#     document = old_prepare(model)
#     document.fields_by_name(:resource_id_ss).first.value = document.fields_by_name(:id).first.value
#     if !document.fields_by_name(:filename).blank? and !document.fields_by_name(:filename).first.blank?
#        document.fields_by_name(:id).first.value = document.fields_by_name(:filename).first.value
#     end
#     document
#   end
#
#   alias :old_remove :remove  
#   def remove(*models)
#     @connection.delete_by_id(
#       models.map do |model| 
#         prepare(model).fields_by_name(:id).first.value
#       end
#     )
#   end
#
# end
#
# # to allow searching with Sunspot's DSL as well to retrieve your models
# class Sunspot::Search::Hit
#   def initialize(raw_hit, highlights, search) 
#     raw_hit['id'] = raw_hit['resource_id_ss']
#     @class_name, @primary_key = *raw_hit['id'].match(/([^ ]+) (.+)/)[1..2]
#     @score = raw_hit['score']
#     @search = search
#     @stored_values = raw_hit
#     @stored_cache = {}
#     @highlights = highlights
#   end
# end

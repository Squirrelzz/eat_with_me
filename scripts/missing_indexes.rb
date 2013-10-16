#!/usr/bin/env ruby

cnx = ActiveRecord::Base.connection
cnx.tables.collect do |t|
  columns = cnx.columns(t).collect(&:name).select {|x| x.ends_with?("_id" || x.ends_with("_type"))}
  indexed_columns = cnx.indexes(t).collect(&:columns).flatten.uniq
  unindexed = columns - indexed_columns

  puts "#{t}: #{unindexed.join(", ")}" unless unindexed.empty?
end

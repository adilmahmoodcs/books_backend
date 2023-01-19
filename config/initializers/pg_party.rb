PgParty.configure do |c|
  c.schema_exclude_partitions = false
  c.create_template_tables = true
  c.create_with_primary_key = false
end

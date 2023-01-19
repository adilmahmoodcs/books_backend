module PartitionedMigrationHelper
  def create_reversible_hash_partition(name, shard_count:, partition_key:, primary_key:, &block)
    reversible do |dir|
      dir.up do
        create_hash_partition(name, partition_key: partition_key, primary_key: primary_key, create_with_primary_key: true, template: false, &block)

        get_partitions(name, shard_count: shard_count).each do |partition_data|
          create_hash_partition_of(
            name,
            modulus: partition_data.modulus,
            remainder: partition_data.remainder,
            name: partition_data.name
          )
        end
      end
      dir.down do
        get_partitions(name, shard_count: shard_count).each do |partition_data|
          drop_table(partition_data.name)
        end

        drop_table(name)
      end
    end
  end

  def get_partitions(name, shard_count:)
    shard_count = 10 unless Rails.env.production?

    (0..(shard_count - 1)).map do |i|
      Struct
        .new(:name, :modulus, :remainder)
        .new("#{name}_shard_#{i}", shard_count, i)
    end
  end
end

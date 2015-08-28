class CreateBandsTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
    end

    create_table(:concerts) do |t|
      t.column(:name, :string)
    end

    create_table(:concerts_bands) do |t|
      t.column(:band_id, :int)
      t.column(:concert_id, :int)
    end

    create_table(:venues) do |t|
      t.column(:name, :string)
    end

    create_table(:venues_bands) do |t|
      t.column(:band_id, :int)
      t.column(:venue_id, :int)
    end
  end
end

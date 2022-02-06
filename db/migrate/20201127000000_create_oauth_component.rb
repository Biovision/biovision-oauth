# frozen_string_literal: true

# Create tables for Users component
class CreateOauthComponent < ActiveRecord::Migration[6.0]
  include Biovision::Migrations::ComponentMigration

  private

  def create_foreign_sites
    create_table :foreign_sites, comment: 'Sites for external authentication' do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.integer :foreign_users_count, default: 0, null: false
    end

    add_index :foreign_sites, :slug, unique: true
  end

  def create_foreign_users
    create_table :foreign_users, comment: 'Users from external sites' do |t|
      t.references :foreign_site, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.references :agent, foreign_key: { on_update: :cascade, on_delete: :nullify }
      t.references :ip_address, foreign_key: { on_update: :cascade, on_delete: :nullify }
      t.string :slug, null: false
      t.timestamps
      t.jsonb :data, default: {}, null: false
    end

    add_index :foreign_users, :data, using: :gin
  end
end

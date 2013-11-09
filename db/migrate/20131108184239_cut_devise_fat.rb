class CutDeviseFat < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :invitation_created_at
      t.remove :invitation_limit
      t.remove :invited_by_id
      t.remove :invited_by_type
      t.rename :encrypted_password, :password_digest
      t.change :password_digest, :string, null: false
    end
  end
end

class MakeEventAndUserinJoinTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :registrations, :name, :string
    remove_column :registrations, :email, :string

    add_column :registrations, :user_id, :integer

    Registration.destroy_all
  end
end

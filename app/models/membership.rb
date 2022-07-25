class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :oneMembershipPerGym

  private

  def oneMembershipPerGym
    client_name = Client.find_by(id: client_id).name
    client_gyms = Client.find_by(id: client_id).gyms
    gym_name = Gym.find_by(id: gym_id).name
    gym_exists = client_gyms.find { |gym| gym.name == gym_name }

    if gym_exists
      errors.add :client, "#{client_name} is already a member of #{gym_name}!"
    end
  end
end

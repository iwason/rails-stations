# == Schema Information
#
# Table name: sheets
#
#  id     :bigint           not null, primary key
#  column :integer          not null
#  row    :string(1)        not null
#
require 'rails_helper'

RSpec.describe Sheet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

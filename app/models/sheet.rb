# == Schema Information
#
# Table name: sheets
#
#  id     :bigint           not null, primary key
#  column :integer          not null
#  row    :string(1)        not null
#
class Sheet < ApplicationRecord
end

class ChangePhoneNullOnContacts < ActiveRecord::Migration[8.1]
  def change
    change_column_null :contacts, :phone, false
  end
end
